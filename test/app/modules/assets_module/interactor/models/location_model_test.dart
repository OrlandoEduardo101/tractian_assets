import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_assets/app/modules/assets_module/interactor/models/location_model.dart';

void main() {
  const String locationItemResponse =
      '''{"id":"60fc4c8707a5ec001e8cc82f","name":"Location 3791","parentId":"60fc4c87513295001f4dd53b"}''';
  const String id = '60fc4c8707a5ec001e8cc82f';
  const String parentId = '60fc4c87513295001f4dd53b';
  const String name = 'Location 3791';
  test('Must return a LocationModel with name == "Location 3791" and id == "60fc4c8707a5ec001e8cc82f"', () {
    final location = LocationModel.fromJson(locationItemResponse);
    expect(location.name, equals(name));
    expect(location.id, equals(id));
  });

  test('Must return a Json (String) with location data', () {
    final location = LocationModel(
      id: id,
      name: name,
      parentId: parentId,
    );
    final json = location.toJson();
    expect(json, equals(locationItemResponse));
  });
}
