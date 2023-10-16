import 'package:equatable/equatable.dart';
import 'package:foodapp/models/Viewmodel/FoodMeals.dart';

class ListFoods extends Equatable{
  String nameDay;
  List<FoodMeals> foodMeals;

  ListFoods({required this.nameDay,required this.foodMeals});
  @override
  List<Object> get props => [nameDay,foodMeals];
}