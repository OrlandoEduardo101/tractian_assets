import 'dart:developer';

import 'package:tractian_assets/app/shared/errors/i_failure.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/services/http_client/i_http_client.dart';
import '../../interactor/models/assets_model.dart';
import '../../interactor/models/location_model.dart';
import '../../interactor/repositories/i_assets_repository.dart';

class AssetsRepository implements IAssetsRepository {
  final IHttpClient httpClient;

  const AssetsRepository(this.httpClient);
  @override
  Future<(List<LocationModel>, String errorMessage)> getLocationList(String companyId) async {
    try {
      final response = await httpClient.get('$kCompaniesEndpoint/$companyId/locations');
      final listLocation = List.from(response.data).map((element) => LocationModel.fromMap(element)).toList();
      return (listLocation, '');
    } on IFailure catch (e) {
      log(e.toString());
      return (<LocationModel>[], e.message);
    }
  }

  @override
  Future<(List<AssetsModel>, String errorMessage)> getAssetsList(String companyId) async {
    try {
      final response = await httpClient.get('$kCompaniesEndpoint/$companyId/assets');
      final listAssetes = List.from(response.data).map((element) => AssetsModel.fromMap(element)).toList();
      return (listAssetes, '');
    } on IFailure catch (e) {
      log(e.toString());
      return (<AssetsModel>[], e.message);
    }
  }
}
