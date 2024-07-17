abstract class IFailure implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const IFailure({
    required this.message,
    required this.stackTrace,
  });
}
