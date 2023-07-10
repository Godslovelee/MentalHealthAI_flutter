///Created on: 10.07.2023
///Last Edited by: Godslove Lee

class ModelModels {
  final String id;
  final String root;
  final int created;

  ModelModels({required this.id, required this.root, required this.created});

  factory ModelModels.fromJson(Map<String, dynamic> jsonmodel) => ModelModels(
      id: jsonmodel["id"],
      root: jsonmodel["root"],
      created: jsonmodel["created"]);
  static List<ModelModels> modelsFromSnap(List modelSnapshot) {
    return modelSnapshot.map((data) => ModelModels.fromJson(data)).toList();
  }
}
