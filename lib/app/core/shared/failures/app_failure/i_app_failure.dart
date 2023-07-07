abstract class IAppFailure implements Exception {
  final String message;
  final StackTrace stackTrace;
  IAppFailure({
    required this.message,
    required this.stackTrace,
  });
}
