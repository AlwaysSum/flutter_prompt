import 'package:flutter/material.dart';

import 'type.dart';

/// toast
class ToastModel {
  final Alignment position;
  final WidgetBuilder builder;
  final String? id;
  final Duration duration;
  final ToastType? type;

  ToastModel(
    this.builder, {
    this.position = Alignment.center,
    this.id,
    this.duration = const Duration(seconds: 2),
    this.type,
  });
}

