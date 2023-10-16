import 'package:equatable/equatable.dart';
import 'package:foodapp/models/Viewmodel/FoodViewmodel.dart';

import '../Foods.dart';

class FoodMeals {
   List<FoodViewmodel> breakfast;
   List<FoodViewmodel> lunch;
   List<FoodViewmodel> dinner;

   FoodMeals({
  required this.breakfast,
  required this.lunch,
  required this.dinner,
  });
   factory FoodMeals.fromJson(Map<String, dynamic> json) {
     return FoodMeals(
       breakfast: (json['breakfast'] as List? ?? [])
           .map((item) => FoodViewmodel.fromJson(item))
           .toList(),
       lunch: (json['lunch'] as List? ?? [])
           .map((item) => FoodViewmodel.fromJson(item))
           .toList(),
       dinner: (json['dinner'] as List? ?? [])
           .map((item) => FoodViewmodel.fromJson(item))
           .toList(),
     );
   }

}