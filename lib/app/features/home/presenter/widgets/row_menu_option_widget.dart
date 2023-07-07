import 'package:dictionary_challenge/app/features/home/presenter/widgets/text_select_tab.dart';
import 'package:flutter/material.dart';

import '../../domain/helpers/enum/menu_title_enum.dart';
import '../controllers/home_controller.dart';

class RowMenuOption extends StatelessWidget {
  final HomeController homeController;
  const RowMenuOption({
    super.key,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextSelectTab(
          text: MenuTitleEnum.word,
          isSelectedTitle: homeController.state.menuOption,
          onTap: () => homeController.store.setMenuOption(MenuTitleEnum.word),
        ),
        TextSelectTab(
            text: MenuTitleEnum.history,
            isSelectedTitle: homeController.state.menuOption,
            onTap: () async {
              homeController.store.setMenuOption(MenuTitleEnum.history);
              await homeController.loadMenuList(MenuTitleEnum.history);
            }),
        TextSelectTab(
          text: MenuTitleEnum.favorites,
          isSelectedTitle: homeController.state.menuOption,
          onTap: () async {
            homeController.store.setMenuOption(MenuTitleEnum.favorites);
            await homeController.loadMenuList(MenuTitleEnum.favorites);
          },
        ),
      ],
    );
  }
}
