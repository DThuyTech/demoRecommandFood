import 'package:equatable/equatable.dart';

class Foods extends Equatable{
  int idFood;
  String name;
  double fat;
  double calories;
  double cacbonhydrat;
  double protein;
  int countlike;
  String RecipeInstruction;
  String RecipeIngredientParts;

  Foods({
    required this.idFood,
    required this.name,
    required this.fat,
    required this.calories,
    required this.cacbonhydrat,
    required this.protein,
    required this.countlike,
    required this.RecipeIngredientParts,
    required this.RecipeInstruction,
  });

  @override
  List<Object> get props => [idFood,name, fat, calories, cacbonhydrat, protein,countlike,RecipeIngredientParts,RecipeInstruction];
}