import 'package:dictionary_challenge/app/features/home/domain/helpers/enum/menu_title_enum.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/statics/strings_colors.dart';

class TextSelectTab extends StatelessWidget {
  final MenuTitleEnum text;
  final MenuTitleEnum isSelectedTitle;
  final Function()? onTap;
  const TextSelectTab({
    super.key,
    required this.text,
    this.onTap,
    required this.isSelectedTitle,
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
            color: isSelectedTitle == text
                ? StringsColors.greyLight
                : StringsColors.white,
          ),
          child: Text(
            MenuTitleEnumExtension.convertEnumToString(text),
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
