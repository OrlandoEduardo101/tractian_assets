import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_assets/app/modules/assets_module/interactor/models/assets_model.dart';

void main() {
  const String assetItemResponse =
      '''{"gatewayId":"VEQ023","id":"60fc4e83513295001f4dd7b7","locationId":"60fc4e7007a5ec001e81aca9","name":"Sensor 204 - vibration","parentId":null,"sensorId":"CXW988","sensorType":"vibration","status":"alert"}''';
  const String gatewayId = 'VEQ023';
  const String id = '60fc4e83513295001f4dd7b7';
  const String locationId = '60fc4e7007a5ec001e81aca9';
  const String sensorId = 'CXW988';
  const String sensorType = 'vibration';
  const String status = 'alert';
  const String assetName = 'Sensor 204 - vibration';
  test('Must return a AssetsModel with name == "Sensor 204 - vibration" and gatewayId == "VEQ023"', () {
    final asset = AssetsModel.fromJson(assetItemResponse);
    expect(asset.name, equals(assetName));
    expect(asset.id, equals(id));
  });

  test('Must return a Json (String) with asset data', () {
    final asset = AssetsModel(
      id: id,
      name: assetName,
      gatewayId: gatewayId,
      locationId: locationId,
      sensorId: sensorId,
      sensorType: sensorType,
      status: status,
    );
    final json = asset.toJson();
    expect(json, equals(assetItemResponse));
  });
}
