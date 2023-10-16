import 'package:equatable/equatable.dart';

class Foodpart extends Equatable{

  int idFoodtype;
  String name;
  int fat;
  int calories;
  int cacbonhydrat;
  int protein;
  String desciption;
  Foodpart({required this.idFoodtype,required this.name,required this.fat,required this.calories,
     required this.cacbonhydrat,required this.protein,required this.desciption});
  @override
  List<Object> get props => [idFoodtype, name, fat, calories,cacbonhydrat,protein, desciption];
}