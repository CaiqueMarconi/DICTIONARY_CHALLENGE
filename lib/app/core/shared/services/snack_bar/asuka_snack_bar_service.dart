import 'package:asuka/asuka.dart';
import 'package:dictionary_challenge/app/core/shared/statics/strings_colors.dart';
import 'package:flutter/material.dart';

import 'i_snack_bar_service.dart';

class AsukaSnackBarService implements ISnackBarService {
  const AsukaSnackBarService();

  @override
  void show({required String message, Color? color, Duration? duration}) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: color ?? StringsColors.black,
    );

    Asuka.showSnackBar(snackBar);
  }
}
