import 'package:tractian_assets/app/modules/assets_module/interactor/repositories/i_assets_repository.dart';

import '../../../../injector.dart';
import '../atoms/assets_atoms.dart';

Future<void> getAssetsListAction(String companyId) async {
  final repository = injector.get<IAssetsRepository>();
  isLoadingState.value = true;
  final result = await repository.getAssetsList(companyId);
  assetsListState.value = result.$1;
  errorMessage.value = result.$2;
  isLoadingState.value = false;
}

Future<void> getLocationListAction(String companyId) async {
  final repository = injector.get<IAssetsRepository>();
  isLoadingState.value = true;
  final result = await repository.getLocationList(companyId);
  locationsListState.value = result.$1;
  errorMessage.value = result.$2;
  isLoadingState.value = false;
}
