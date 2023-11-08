import 'package:flutter/material.dart';

/// toast
class LoadingModel {
  final WidgetBuilder builder;
  final Color? maskColor;

  LoadingModel(
    this.builder, {
    this.maskColor,
  });
}
