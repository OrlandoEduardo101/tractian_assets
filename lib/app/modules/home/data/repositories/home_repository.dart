import 'dart:developer';

import 'package:tractian_assets/app/modules/home/interactor/models/company_model.dart';
import 'package:tractian_assets/app/shared/errors/i_failure.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/services/http_client/i_http_client.dart';
import '../../interactor/repositories/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  final IHttpClient httpClient;

  HomeRepository(this.httpClient);
  @override
  Future<(List<CompanyModel>, String errorMessage)> getCompanyList() async {
    try {
      final response = await httpClient.get(kCompaniesEndpoint);
      final listCompanies = List.from(response.data).map((element) => CompanyModel.fromMap(element)).toList();
      return (listCompanies, '');
    } on IFailure catch (e) {
      log(e.toString());
      return (<CompanyModel>[], e.message);
    }
  }
}
