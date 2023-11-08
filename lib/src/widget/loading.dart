import 'package:flutter/material.dart';
import 'package:flutter_prompt/flutter_prompt.dart';

///Loading 组件
class LoadingContainer extends StatelessWidget {
  const LoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Prompt.instance.loading,
      builder: (context, loading, child) {
        return loading?.builder == null
            ? const SizedBox()
            : AbsorbPointer(
                child: Container(
                  color: loading?.maskColor ?? Colors.black12,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Center(
                    child: loading!.builder(context),
                  ),
                ),
              );
      },
    );
  }
}
