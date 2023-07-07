import 'package:dictionary_challenge/app/core/core_module.dart';
import 'package:dictionary_challenge/app/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
