class FoodViewmodel {
  final int id;
  final String name;
  final double calories;
  final double protein;
  final double carbohydrates;
  final double fat;
  final String imageUrl;
  String RecipeInstruction;
  String RecipeIngredientParts;

  FoodViewmodel({
    required this.id,
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
    required this.imageUrl,
    required this.RecipeIngredientParts,
    required this.RecipeInstruction,
  });
  String getURL(){
    if(this.imageUrl.isNotEmpty){
      return this.imageUrl;
    }
    return  'https://thumbs.dreamstime.com/b/white-update-update-software-icon-logo-dark-background-update-update-software-icon-logo-dark-background-134042639.jpg';
  }
  factory FoodViewmodel.fromJson(Map<String, dynamic> json) {
    return FoodViewmodel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      calories: (json['calories'] ?? 0).toDouble(),
      protein: (json['protein'] ?? 0).toDouble(),
      carbohydrates: (json['carbohydrates'] ?? 0).toDouble(),
      fat: (json['fat'] ?? 0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      RecipeIngredientParts: json["recipeIngredientParts"] ?? '',
      RecipeInstruction: json["recipeInstructions"] ?? '',

    );
  }
}