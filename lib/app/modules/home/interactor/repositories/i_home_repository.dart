import 'package:tractian_assets/app/modules/home/interactor/models/company_model.dart';

abstract class IHomeRepository {
  Future<(List<CompanyModel>, String errorMessage)> getCompanyList();
}
