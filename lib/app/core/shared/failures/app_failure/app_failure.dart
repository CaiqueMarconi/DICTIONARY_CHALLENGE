import 'package:dictionary_challenge/app/core/shared/failures/app_failure/i_app_failure.dart';

class AppException extends IAppFailure {
  AppException({required super.message, required super.stackTrace});
}
