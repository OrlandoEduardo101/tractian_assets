import 'package:tractian_assets/app/modules/home/interactor/repositories/i_home_repository.dart';

import '../../../../injector.dart';
import '../atoms/home_atom.dart';

Future<void> getCompaniesListAction() async {
  final repository = injector.get<IHomeRepository>();
  isLoadingState.value = true;
  final result = await repository.getCompanyList();
  companiesListState.value = result.$1;
  errorMessage.value = result.$2;
  isLoadingState.value = false;
}
