// ignore_for_file: use_build_context_synchronously

import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/statics/strings_colors.dart';

void dialogDeleteFavoriteWord(context,
    {required Future<void> Function() deleteWordFavorite}) {
  final size = MediaQuery.of(context).size;
  Asuka.showDialog(
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Deseja Desfavoritar esta palavra?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: size.width * 0.050,
            ),
          ),
          SizedBox(height: size.width * 0.060),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: StringsColors.greyDark,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Não',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.040,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: StringsColors.black,
                ),
                onPressed: () async {
                  await deleteWordFavorite();
                  Navigator.pop(context);
                },
                child: Text(
                  'Sim',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.040,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
