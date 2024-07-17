class NodeEntity {
  String id;
  String name;
  String? parentId;
  NodeEntity({
    required this.id,
    required this.name,
    this.parentId,
  });
}
