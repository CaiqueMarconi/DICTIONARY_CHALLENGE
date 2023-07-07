import 'package:dictionary_challenge/app/features/home/domain/usecases/get_list_words_usecase/get_list_words_usecase.dart';
import 'package:dictionary_challenge/app/features/home/external/datasources/get_list_words_datasource.dart';
import 'package:dictionary_challenge/app/features/home/infra/repositories/get_list_words_repository.dart';
import 'package:dictionary_challenge/app/features/home/presenter/controllers/home_controller.dart';
import 'package:dictionary_challenge/app/features/home/presenter/pages/home_page.dart';
import 'package:dictionary_challenge/app/features/home/presenter/pages/view_data_word_page.dart';
import 'package:dictionary_challenge/app/features/home/presenter/stores/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_data_word_usecase/get_data_word_usecase.dart';
import 'external/datasources/get_data_word_datasource.dart';
import 'infra/repositories/get_data_word_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // stores
        Bind.singleton((i) => HomeStore(
              getDataWordUsecase: i(),
              getListWordsUsecase: i(),
              sqfliteService: i(),
            )),
        // controllers
        Bind.singleton((i) => HomeController(
              homeStore: i(),
              snackBarService: i(),
            )),

        // get list word
        Bind.lazySingleton((i) => GetListWordUsecase(i())),
        Bind.lazySingleton((i) => GetListWordsRepository(i())),
        Bind.lazySingleton((i) => GetListWordsDatasource(httpService: i())),

        // get data word
        Bind.lazySingleton((i) => GetDataWordUsecase(i())),
        Bind.lazySingleton((i) => GetDataWordRepository(i())),
        Bind.lazySingleton((i) => GetDataWordDatasource(httpService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomePage(
            homeController: Modular.get<HomeController>(),
          ),
        ),
        ChildRoute(
          '/view_word',
          child: (_, args) => ViewDataWordPage(
            dataWord: args.data['dataWord'],
          ),
        ),
      ];
}
