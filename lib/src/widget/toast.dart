import 'package:flutter/material.dart';
import 'package:flutter_prompt/flutter_prompt.dart';
import 'package:flutter_prompt/src/model/toast_model.dart';

/// 存放 toast 的容器
class ToastContainer extends StatefulWidget {
  const ToastContainer({super.key});

  @override
  State<ToastContainer> createState() => _ToastContainerState();
}

class _ToastContainerState extends State<ToastContainer> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Prompt.instance.toastList,
      builder: (context, list, child) {
        return Stack(
          children: [
            //顶部
            Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Column(
                children: list
                    .where(
                      (element) => [
                        Alignment.topCenter,
                        Alignment.topLeft,
                        Alignment.topRight
                      ].contains(element.position),
                    )
                    .map(
                      (e) => Align(
                        alignment: e.position,
                        child: e.builder(context),
                      ),
                    )
                    .toList(),
              ),
            ),
            //中间
            Center(
              child: list
                  .lastWhere((element) => element.position == Alignment.center,
                      orElse: () => ToastModel((_) => const SizedBox()))
                  .builder(context),
            ),
            //底部
            Positioned(
              bottom: 100,
              left: 20,
              right: 20,
              child: Column(
                children: list
                    .where(
                      (element) => [
                        Alignment.bottomCenter,
                        Alignment.bottomLeft,
                        Alignment.bottomRight
                      ].contains(element.position),
                    )
                    .map(
                      (e) => Align(
                        alignment: e.position,
                        child: e.builder(context),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
