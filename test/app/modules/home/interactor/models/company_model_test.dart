import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_assets/app/modules/home/interactor/models/company_model.dart';

void main() {
  const String companyItemResponse = '''{"id":"662fd0ee639069143a8fc387","name":"Jaguar"}''';
  const String companyName = 'Jaguar';
  const String companyId = '662fd0ee639069143a8fc387';
  test('Must return a CompanyModel with name == "Jaguar" and id == "662fd0ee639069143a8fc387"', () {
    final company = CompanyModel.fromJson(companyItemResponse);
    expect(company.name, equals(companyName));
    expect(company.id, equals(companyId));
  });

  test('Must return a Json (String) with company data', () {
    final company = CompanyModel(id: companyId, name: companyName);
    final json = company.toJson();
    expect(json, equals(companyItemResponse));
  });
}
