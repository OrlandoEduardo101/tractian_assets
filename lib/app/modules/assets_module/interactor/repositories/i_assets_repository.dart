import 'package:tractian_assets/app/modules/assets_module/interactor/models/assets_model.dart';
import 'package:tractian_assets/app/modules/assets_module/interactor/models/location_model.dart';

abstract class IAssetsRepository {
  Future<(List<LocationModel>, String errorMessage)> getLocationList(String companyId);
  Future<(List<AssetsModel>, String errorMessage)> getAssetsList(String companyId);
}
