import 'package:dictionary_challenge/app/core/shared/statics/strings_colors.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/shared/statics/string_assets.dart';
import '../widgets/text_buttom_custom.dart';

class ViewDataWordPage extends StatelessWidget {
  final DataWordEntity dataWord;
  const ViewDataWordPage({
    super.key,
    required this.dataWord,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: StringsColors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Modular.to.pop();
            },
            child: Icon(
              Icons.close,
              size: size.width * 0.090,
              color: StringsColors.black,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  border: Border.all(width: 3),
                  color: const Color.fromARGB(255, 253, 219, 230),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dataWord.word,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.060,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: size.width * 0.050),
                    if (dataWord.pronunciation != null)
                      Text(
                        dataWord.pronunciation!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.width * 0.060,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.030),
              Row(
                children: [
                  Image.asset(
                    StringAssets.arrowPlay,
                    scale: 1.9,
                  ),
                  Expanded(
                    child: Container(
                      width: size.width,
                      height: size.width * 0.030,
                      decoration: BoxDecoration(
                        color: StringsColors.blue,
                        borderRadius: BorderRadius.circular(size.width * 0.020),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.width * 0.030),
              const Spacer(),
              Text(
                'Meanings',
                style: TextStyle(
                  fontSize: size.width * 0.080,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: size.width * 0.030),
              Text(
                dataWord.definition!,
                style: TextStyle(
                  fontSize: size.width * 0.050,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.width * 0.030),
              Row(
                children: [
                  const TextButtomCustom(
                    text: 'Voltar',
                  ),
                  SizedBox(width: size.width * 0.026),
                  const TextButtomCustom(
                    text: 'Próximo',
                  ),
                ],
              ),
              SizedBox(height: size.width * 0.040),
            ],
          ),
        ),
      ),
    );
  }
}
