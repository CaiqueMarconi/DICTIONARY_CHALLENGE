import 'package:dictionary_challenge/app/core/shared/services/http/dio_http_service.dart';
import 'package:dictionary_challenge/app/core/shared/services/snack_bar/asuka_snack_bar_service.dart';
import 'package:dictionary_challenge/app/core/shared/services/sqflite/sqflite_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => Dio(), export: true),
        Bind.singleton((i) => DioHttpService(dio: i()), export: true),
        Bind.singleton((i) => const AsukaSnackBarService(), export: true),
        Bind.singleton((i) => SqfliteService(), export: true),
      ];
}
