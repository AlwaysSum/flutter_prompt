import 'package:flutter/material.dart';
import 'model/type.dart';
import 'widget/spin/spin_circle.dart';

class DefaultFlutterPromptCustomStyle with FlutterPromptCustomStyle {}

///自定义样式
mixin FlutterPromptCustomStyle {
  ///一些配置
  ///颜色
  final colorSuccess = Colors.green;
  final colorError = Colors.red;
  final colorInfo = Colors.blue;
  final colorWarning = Colors.yellow.shade700;
  final colorDefault = Colors.black54;

  ///图标
  final iconSuccess = const Icon(
    Icons.check_circle_outline,
    color: Colors.white,
  );
  final iconError = const Icon(
    Icons.error_outline,
    color: Colors.white,
  );
  final iconInfo = const Icon(
    Icons.info,
    color: Colors.white,
  );
  final iconWarning = const Icon(
    Icons.warning_amber,
    color: Colors.white,
  );
  final iconDefault = null;

  ///toast 样式
  final toastPadding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16);
  final toastRadius = BorderRadius.circular(8);
  final double toastGap = 4;

  double toastMaxWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.8;

  /// 自定义 toast
  Widget customToastStyle(
    BuildContext context,
    String msg, {
    Alignment alignment = Alignment.center,
    String? id,
    Duration? duration,
    ToastType? type,
  }) {
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
  final loadingColor = Colors.black54;
  final loadingBgColor = Colors.black54;
  final loadingBgRadius = BorderRadius.circular(8);
  final loadingBgMargin = const EdgeInsets.all(8);
  final loadingSpin = const Center(
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
