import 'package:flutter/material.dart';
import 'package:flutter_prompt/src/custom_style.dart';
import '../flutter_prompt_platform_interface.dart';
import 'model/loading_model.dart';
import 'model/toast_model.dart';
import 'model/type.dart';
import 'widget/root.dart';

///FlutterPrompt
class Prompt {
  Future<String?> getPlatformVersion() {
    return FlutterPromptPlatform.instance.getPlatformVersion();
  }

  factory Prompt() => _instance;
  static final Prompt _instance = Prompt._internal();

  Prompt._internal();

  static Prompt get instance => _instance;

  FlutterPromptCustomStyle? _style;

  FlutterPromptCustomStyle get style {
    return _style ??= DefaultFlutterPromptCustomStyle();
  }

  /// init FlutterPrompt
  static TransitionBuilder init({
    TransitionBuilder? builder,
    FlutterPromptCustomStyle? style,
  }) {
    instance._style = style;
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, FlutterPromptRoot(child: child));
      } else {
        return FlutterPromptRoot(child: child);
      }
    };
  }

  /// init FlutterPrompt By Widget
  static FlutterPromptRoot initRoot({
    Widget? child,
    FlutterPromptCustomStyle? style,
  }) {
    instance._style = style;
    return FlutterPromptRoot(child: child);
  }

  ///toast values
  final toastList = ValueNotifier<List<ToastModel>>([]);

  /// show toast
  /// [type] ToastType
  static Future showToast(
    String msg, {
    Alignment alignment = Alignment.center,
    String? id,
    Duration? duration,
    ToastType? type,
  }) {
    final model = ToastModel(
      (context) => instance.style.customToastStyle(
        context,
        msg,
        alignment: alignment,
        id: id,
        duration: duration,
        type: type,
      ),
      id: id,
      duration: duration ?? const Duration(seconds: 2),
      position: alignment,
      type: type,
    );
    return _showToastModel(model);
  }

  /// 显示一个组件
  static Future showToastWidget(
    WidgetBuilder builder, {
    Alignment alignment = Alignment.center,
    String? id,
    Duration? duration,
    ToastType? type,
  }) {
    final model = ToastModel(
      builder,
      id: id,
      duration: duration ?? const Duration(seconds: 2),
      position: alignment,
      type: type,
    );
    return _showToastModel(model);
  }

  ///通过实体类显示 toast
  static Future _showToastModel(ToastModel model) {
    instance.toastList.value.add(model);
    final maxCount = instance.style.toastMaxCount;
    if (instance.toastList.value.length > maxCount) {
      instance.toastList.value.removeRange(
        0,
        instance.toastList.value.length - maxCount,
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      instance.toastList.notifyListeners();
    });

    ///延时删除
    return Future.delayed(model.duration, () {
      instance.toastList.value.remove(model);
      instance.toastList.notifyListeners();
    });
  }

  ///loading values
  final loading = ValueNotifier<LoadingModel?>(null);

  /// 该标志处理异步任务的 loading 调用问题，如果在组件没有渲染时调用 loading，
  /// 但是很快的结束了 loading 则会出现 loading的 hide 在 show 之前关闭的情况。
  /// WidgetsBinding.instance.addPostFrameCallback是为了处理setState() or markNeedsBuild() called during build.异常情况
  static var _loadingFlag = false;

  ///显示 Loading
  static showLoading({String? msg, String? defaultMsg, Color? maskColor}) {
    _loadingFlag = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_loadingFlag) {
        instance.loading.value = LoadingModel(
          (context) => instance.style.customLoadingStyle(
            context,
            msg,
            defaultMsg: defaultMsg,
            maskColor: maskColor,
          ),
          maskColor: maskColor ?? instance.style.loadingDefaultMaskColor,
        );
        instance.loading.notifyListeners();
      }
    });
  }

  ///关闭 Loading
  static hideLoading() {
    _loadingFlag = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!_loadingFlag) {
        instance.loading.value = null;
        instance.loading.notifyListeners();
      }
    });
  }
}
