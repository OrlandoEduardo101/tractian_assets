import 'dart:convert';

import 'node_entity.dart';

class AssetsModel extends NodeEntity {
  AssetsModel({
    required this.sensorType,
    required this.status,
    required this.gatewayId,
    required this.sensorId,
    required super.id,
    required super.name,
    super.parentId,
    super.locationId,
  });
  final String sensorType;
  final String status;
  final String gatewayId;
  final String sensorId;

  Map<String, dynamic> toMap() {
    return {
      'gatewayId': gatewayId,
      'id': id,
      'locationId': locationId,
      'name': name,
      'parentId': parentId,
      'sensorId': sensorId,
      'sensorType': sensorType,
      'status': status,
    };
  }

  factory AssetsModel.fromMap(Map<String, dynamic> map) {
    return AssetsModel(
      locationId: map['locationId'] ?? '',
      sensorType: map['sensorType'] ?? '',
      status: map['status'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      parentId: map['parentId'],
      sensorId: map['sensorId'] ?? '',
      gatewayId: map['gatewayId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AssetsModel.fromJson(String source) => AssetsModel.fromMap(json.decode(source));
}
