import 'package:flutter/material.dart';

import '../../../../core/shared/statics/strings_colors.dart';

class TextButtomCustom extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const TextButtomCustom({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: size.width * 0.010),
          decoration: BoxDecoration(
            border: Border.all(width: 1.6),
            color: StringsColors.white,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.width * 0.048,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
