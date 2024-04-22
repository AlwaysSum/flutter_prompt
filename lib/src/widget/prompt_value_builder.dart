import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

//https://docs.flutter.dev/development/tools/sdk/release-notes/release-notes-3.0.0
T? _ambiguate<T>(T? value) => value;

typedef PromptValueWidgetBuilder<T> = Widget Function(
    BuildContext context, T value, Widget? child);

class PromptValueListenableBuilder<T> extends StatefulWidget {
  const PromptValueListenableBuilder({
    super.key,
    required this.valueListenable,
    required this.builder,
    this.child,
  });

  @override
  State<PromptValueListenableBuilder<T>> createState() =>
      _PromptValueListenableBuilderState<T>();
  final ValueListenable<T> valueListenable;
  final PromptValueWidgetBuilder<T> builder;

  final Widget? child;
}

class _PromptValueListenableBuilderState<T> extends State<PromptValueListenableBuilder<T>> {
  late T value;

  @override
  void initState() {
    super.initState();
    value = widget.valueListenable.value;
    widget.valueListenable.addListener(_valueChanged);
  }

  @override
  void didUpdateWidget(PromptValueListenableBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.valueListenable != widget.valueListenable) {
      oldWidget.valueListenable.removeListener(_valueChanged);
      value = widget.valueListenable.value;
      widget.valueListenable.addListener(_valueChanged);
    }
  }

  @override
  void dispose() {
    widget.valueListenable.removeListener(_valueChanged);
    super.dispose();
  }

  void _valueChanged() {
    setState(() {
      value = widget.valueListenable.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, value, widget.child);
  }

  @override
  void setState(VoidCallback fn) {
    ///修复 release 模式下，在刷新时触发 build 导致组件后续无法build 问题
    if (_ambiguate(SchedulerBinding.instance)!.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      _ambiguate(SchedulerBinding.instance)!.addPostFrameCallback((_) {
        super.setState(fn);
      });
    } else {
      super.setState(fn);
    }
  }
}
