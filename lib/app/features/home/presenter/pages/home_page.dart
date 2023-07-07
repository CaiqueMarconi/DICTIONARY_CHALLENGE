import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:dictionary_challenge/app/features/home/presenter/controllers/home_controller.dart';
import '../../domain/helpers/enum/menu_title_enum.dart';
import '../widgets/custom_gridview_widget.dart';
import '../widgets/row_menu_option_widget.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;
  const HomePage({
    super.key,
    required this.homeController,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeController.store.createDb();
    widget.homeController.loadListWord();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.width * 0.028),
              ScopedBuilder(
                store: widget.homeController.store,
                onState: (context, state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowMenuOption(homeController: widget.homeController),
                    SizedBox(height: size.width * 0.036),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.010),
                      child: Text(
                        MenuTitleEnumExtension.convertEnumToString(
                          widget.homeController.state.menuOption,
                        ),
                        style: TextStyle(
                          fontSize: size.width * 0.048,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.036),
              ScopedBuilder(
                store: widget.homeController.store,
                onState: (ctx, state) {
                  // chama o widget de loading
                  if (widget.homeController.state.listWords.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(),
                            SizedBox(height: size.width * 0.026),
                            const Text('Carregando Palavras...')
                          ],
                        ),
                      ),
                    );
                  }
                  // widget de lista de palavras infinitas obtidas pela api
                  // palavras disponibilizadas no repo do desafio
                  if (widget.homeController.state.menuOption ==
                      MenuTitleEnum.word) {
                    return CustomGridviewWidget(
                      enableOnLongPress: true,
                      homeController: widget.homeController,
                      listWords: widget.homeController.state.listWords,
                    );
                  }
                  // widget com as palavras favoritadas
                  if (widget.homeController.state.menuOption ==
                      MenuTitleEnum.favorites) {
                    return CustomGridviewWidget(
                      enableOnLongPress: true,
                      homeController: widget.homeController,
                      listWords: widget.homeController.state.listWordsFavorites
                          .map((e) => WordEntity(word: e.word))
                          .toList(),
                    );
                    // widget os as palavras clicadas e que possuem conteudo da WordApi
                  } else {
                    return CustomGridviewWidget(
                      enableOnLongPress: false,
                      homeController: widget.homeController,
                      listWords: widget.homeController.state.listWordsHistory
                          .map((e) => WordEntity(word: e.word))
                          .toList(),
                    );
                  }
                },
              ),
              SizedBox(height: size.height * 0.010)
            ],
          ),
        ),
      ),
    );
  }
}
