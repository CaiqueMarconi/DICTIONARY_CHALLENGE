import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_list_words_param.dart';
import 'package:flutter/material.dart';
import '../../../../core/shared/statics/strings_colors.dart';
import '../../domain/entities/word_entity.dart';
import '../controllers/home_controller.dart';

class CustomGridviewWidget extends StatelessWidget {
  final bool enableOnLongPress;
  final HomeController homeController;
  final List<WordEntity> listWords;
  const CustomGridviewWidget({
    super.key,
    required this.enableOnLongPress,
    required this.homeController,
    required this.listWords,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: GridView.builder(
        itemCount: listWords.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: size.width * 1 / 3,
        ),
        itemBuilder: (ctx, index) {
          if (index == listWords.length / 2) {
            homeController.store.getListWord(GetListWordParam(
              initRange: listWords.length,
              finalRange: listWords.length + 1000,
            ));
          }
          final word = listWords[index];
          return GestureDetector(
            onLongPress: () async {
              await homeController.fluxOnlongPressGridView(
                enableOnLongPress,
                context,
                word,
              );
            },
            onTap: () async {
              await homeController.fluxViewDetailsWord(context, word);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.010),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.2,
                  color: StringsColors.greyDark,
                ),
              ),
              child: Text(
                word.word,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.050,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
