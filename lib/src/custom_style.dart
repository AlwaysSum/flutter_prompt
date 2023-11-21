import 'package:flutter/material.dart';
import 'model/type.dart';
import 'widget/spin/spin_circle.dart';

class DefaultFlutterPromptCustomStyle with FlutterPromptCustomStyle {}

///自定义样式
mixin FlutterPromptCustomStyle {
  ///一些配置
  ///颜色
  final Color colorSuccess = Colors.green;
  final Color colorError = Colors.red;
  final Color colorInfo = Colors.blue;
  final Color colorWarning = Colors.yellow.shade700;
  final Color colorDefault = Colors.black54;

  ///图标
  final Widget iconSuccess = const Icon(
    Icons.check_circle_outline,
    color: Colors.white,
  );
  final Widget iconError = const Icon(
    Icons.error_outline,
    color: Colors.white,
  );
  final Widget iconInfo = const Icon(
    Icons.info,
    color: Colors.white,
  );
  final Widget iconWarning = const Icon(
    Icons.warning_amber,
    color: Colors.white,
  );
  final iconDefault = null;

  ///toast 样式
  final toastPadding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16);
  final toastRadius = BorderRadius.circular(20);
  final double toastGap = 4;
  final int toastMaxCount = 3;
  final Alignment toastDefaultAlignment = Alignment.center;

  double toastMaxWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.8;

  /// 自定义 toast
  Widget customToastStyle(
    BuildContext context,
    String msg, {
    Alignment? alignment,
    String? id,
    Duration? duration,
    ToastType? type,
  }) {
    alignment ??= toastDefaultAlignment;

    final color = switch (type) {
      ToastType.success => colorSuccess,
      ToastType.error => colorError,
      ToastType.warning => colorWarning,
      ToastType.info => colorInfo,
      _ => Colors.black54,
    };
    final icon = switch (type) {
      ToastType.success => iconSuccess,
      ToastType.error => iconError,
      ToastType.warning => iconWarning,
      ToastType.info => iconInfo,
      _ => null,
    };

    return Container(
      padding: toastPadding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: toastRadius,
      ),
      margin:  EdgeInsets.symmetric(vertical: toastGap),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon, SizedBox(width: toastGap)],
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: toastMaxWidth(context),
            ),
            child: Text(
              msg,
              style: const TextStyle(color: Colors.white),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          )
        ],
      ),
    );
  }

  ///一些 loading 配置
  final loadingWidth = 80.0;
  final loadingHeight = 80.0;
  final Color loadingColor = Colors.black54;
  final Color loadingBgColor = Colors.black54;
  final loadingBgRadius = BorderRadius.circular(8);
  final loadingBgMargin = const EdgeInsets.all(8);
  final Widget loadingSpin = const Center(
    child: SpinCircle(
      color: Colors.white,
      size: 50,
    ),
  );
  final loadingDefaultMaskColor = Colors.black12;
  final loadingDefaultText = "loading";

  ///自定义 Loading
  Widget customLoadingStyle(
    BuildContext context,
    String? msg, {
    String? defaultMsg,
    Color? maskColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: loadingWidth,
          height: loadingHeight,
          decoration: BoxDecoration(
            color: loadingBgColor,
            borderRadius: loadingBgRadius,
          ),
          margin: loadingBgMargin,
          child: loadingSpin,
        ),
        Text(msg ?? loadingDefaultText)
      ],
    );
  }
}
