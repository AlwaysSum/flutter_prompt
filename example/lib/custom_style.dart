import 'package:flutter/material.dart';
import 'package:flutter_prompt/flutter_prompt.dart';

class MyCustomStyle with FlutterPromptCustomStyle {
  ///自定义颜色
  ///Custom color
  @override
  Color get colorDefault => super.colorDefault;

  @override
  Color get colorError => super.colorError;

  @override
  Color get colorInfo => super.colorInfo;

  @override
  Color get colorSuccess => super.colorSuccess;

  @override
  Color get colorWarning => super.colorWarning;

  ///自定义图标
  ///Custom icon
  @override
  get iconDefault => super.iconDefault;

  @override
  Widget get iconError => super.iconError;

  @override
  Widget get iconInfo => super.iconInfo;

  @override
  Widget get iconSuccess => super.iconSuccess;

  @override
  Widget get iconWarning => super.iconWarning;

  ///自定义吐司设置
  ///Custom toast
  @override
  BorderRadius get toastRadius => super.toastRadius;

  @override
  EdgeInsets get toastPadding => super.toastPadding;

  @override
  double get toastGap => super.toastGap;

  ///自定义loading
  ///Custom loadng
  @override
  EdgeInsets get loadingBgMargin => super.loadingBgMargin;

  @override
  BorderRadius get loadingBgRadius => super.loadingBgRadius;

  @override
  Color get loadingColor => super.loadingColor;

  @override
  Color get loadingDefaultMaskColor => super.loadingDefaultMaskColor;

  @override
  String get loadingDefaultText => super.loadingDefaultText;

  @override
  double get loadingHeight => super.loadingHeight;

  @override
  Widget get loadingSpin => super.loadingSpin;

  @override
  double get loadingWidth => super.loadingWidth;

  ///自定义 loading 的显示组件
  @override
  Widget customLoadingStyle(BuildContext context, String? msg,
      {String? defaultMsg, Color? maskColor}) {
    return super.customLoadingStyle(context, msg,
        defaultMsg: defaultMsg, maskColor: maskColor);
  }

  ///自定义 toast 的显示方式
  @override
  Widget customToastStyle(BuildContext context, String msg,
      {Alignment alignment = Alignment.center,
      String? id,
      Duration? duration,
      ToastType? type}) {
    return super.customToastStyle(context, msg,
        alignment: alignment, id: id, duration: duration, type: type);
  }
}
