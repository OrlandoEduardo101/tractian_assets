import 'dart:convert';

class CompanyModel {
  final String id;
  final String name;

  CompanyModel({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source));

  CompanyModel copyWith({
    String? id,
    String? name,
  }) {
    return CompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
