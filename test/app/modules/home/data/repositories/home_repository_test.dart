import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_assets/app/modules/home/data/repositories/home_repository.dart';
import 'package:tractian_assets/app/modules/home/interactor/models/company_model.dart';
import 'package:tractian_assets/app/modules/home/interactor/repositories/i_home_repository.dart';
import 'package:tractian_assets/app/shared/errors/http_client_error.dart';
import 'package:tractian_assets/app/shared/services/http_client/http_response.dart';
import 'package:tractian_assets/app/shared/services/http_client/i_http_client.dart';

class HttpClientMock extends Mock implements IHttpClient {}

main() {
  late final IHomeRepository repository;
  late final IHttpClient httpClient;

  const String responseJson =
      '''[{"id":"662fd0ee639069143a8fc387","name":"Jaguar"},{"id":"662fd0fab3fd5656edb39af5","name":"Tobias"},{"id":"662fd100f990557384756e58","name":"Apex"}]''';

  setUpAll(() {
    httpClient = HttpClientMock();
    repository = HomeRepository(httpClient);
  });

  test('Must return a list of CompanyModel when http client return response with succes', () async {
    // mock
    when(() => httpClient.get(any()))
        .thenAnswer((_) async => HttpResponse(data: jsonDecode(responseJson), statusCode: 200));

    // act
    final result = await repository.getCompanyList();

    // assert
    expect(result.$1, isA<List<CompanyModel>>());
    expect(result.$1.length, equals(3));
    expect(result.$2.isEmpty, true);
  });

  test('Must return a list of CompanyModel when http client return response with succes', () async {
    // mock
    when(() => httpClient.get(any())).thenThrow(const HttpClientError(
        data: {'message': 'Expired token'}, message: '401 - Authentication invalid', stackTrace: null));

    // act
    final result = await repository.getCompanyList();

    // assert
    expect(result.$1.isEmpty, true);
    expect(result.$2, equals('401 - Authentication invalid'));
  });
}
