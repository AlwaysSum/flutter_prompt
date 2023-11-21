import 'package:flutter/material.dart';

/// 异步请求组件
class FutureWidget<T> extends StatelessWidget {
  const FutureWidget(
      {Key? key,
      required this.onSuccess,
      this.onError,
      this.loading,
      required this.future})
      : super(key: key);

  final Future<T> future;
  final Widget Function(BuildContext context, T? data) onSuccess;
  final Widget? Function(BuildContext context, dynamic error)? onError;
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              final err = snapshot.error;
              final errorWidget =
                  onError != null ? onError!(context, err) : null;
              if (errorWidget != null) {
                return errorWidget;
              } else {
                return const Center(
                  child: Text("加载失败"),
                );
              }
            }
            return onSuccess(context, snapshot.data);
          } else {
            return loading ??
                const Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
                );
          }
        });
  }
}
