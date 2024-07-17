import 'package:tractian_assets/app/shared/errors/i_failure.dart';

class DatasourceError extends IFailure {
  const DatasourceError({
    required super.message,
    required super.stackTrace,
  });
}
