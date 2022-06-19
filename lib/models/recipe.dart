class Recipe {
  final String id;
  final String name;
  final String ingredients;
  final String steps;
  final String image;

  Recipe(
      {required this.image,
      required this.id,
      required this.ingredients,
      required this.steps,
      required this.name});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        image: json['image'] as String,
        ingredients: json['ingredients'][0]['ingredient'] as String,
        steps: json['steps'][0]['shortDescription'] as String,
        id: json['id'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe{name: $name, image: $image, ingredients: $ingredients, steps: $steps, id: $id}';
  }
}
