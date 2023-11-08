import 'package:flutter/material.dart';
import 'package:flutter_prompt/src/widget/loading.dart';

import 'toast.dart';

/// prompt root
class FlutterPromptRoot extends StatelessWidget {
  const FlutterPromptRoot({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.titleSmall ??
          const TextStyle(color: Colors.black, fontSize: 12),
      child: Stack(
        children: [
          // 页面
          child ?? Container(),
          //bubble
          // toast
          const ToastContainer(),
          // loading
          const LoadingContainer(),
        ],
      ),
    );
  }
}
