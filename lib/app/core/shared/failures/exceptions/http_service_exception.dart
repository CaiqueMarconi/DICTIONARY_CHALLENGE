import '../app_failure/i_app_failure.dart';

final class HttpServiceException extends IAppFailure {
  final int statusCode;
  HttpServiceException({
    required super.message,
    required this.statusCode,
    required super.stackTrace,
  });
}
