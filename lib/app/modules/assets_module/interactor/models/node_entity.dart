class NodeEntity {
  String id;
  String name;
  String? parentId;
  String? locationId;
  
  List<NodeEntity> children = [];

  NodeEntity({
    required this.id,
    required this.name,
    this.parentId,
    this.locationId,
  });
}
