import 'package:flutter/material.dart';

abstract class ISnackBarService {
  void show({
    required String message,
    Color? color,
    Duration? duration,
  });
}
