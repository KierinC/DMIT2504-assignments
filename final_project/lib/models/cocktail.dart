class Cocktail {
  String name = '';
  String imageUrl = '';
  String instructions = '';
  String ingredients = '';


  Cocktail({
    required this.name,
    required this.imageUrl,
    required this.instructions,
    required this.ingredients,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'instructions': instructions,
      'ingredients': ingredients,
    };
  }
}