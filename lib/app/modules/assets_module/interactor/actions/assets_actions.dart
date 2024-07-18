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

void computeListAction() {
  nodesComputedListState.value = [
    ...locationsListState.value,
    ...assetsListState.value,
  ];
  nodesComputedListStateFiltered.value = nodesComputedListState.value;
}

void filterListFromText(String filter) {
  nodesComputedListState.value = [
    ...locationsListState.value,
    ...assetsListState.value,
  ];
  if (filter.isEmpty) {
    nodesComputedListStateFiltered.value = nodesComputedListState.value;
    return;
  }
  final list = nodesComputedListState.value.where((e) => e.name.toLowerCase().contains(filter));
  nodesComputedListStateFiltered.value = list.toList();
}

void filterListFromEnergySensors() {
  final list = assetsListState.value.where((e) => e.sensorType.toLowerCase().contains("energy"));
  nodesComputedListStateFiltered.value = list.toList();
}

void filterListFromCriticalAlert() {
  final list = assetsListState.value.where((e) => e.status.toLowerCase().contains("alert"));
  nodesComputedListStateFiltered.value = list.toList();
}
