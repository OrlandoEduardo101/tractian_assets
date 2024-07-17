import 'i_failure.dart';

class RepositoryError extends IFailure {
  const RepositoryError({
    required super.message,
    required super.stackTrace,
  });
}
