import 'package:equatable/equatable.dart';

class DetailNutribution extends Equatable{
  int idDetailNutribution;
  int idFood;
  int idNutri;
  int level;

  DetailNutribution({
    required this.idDetailNutribution,required this.idFood,required this.idNutri, required this.level});
  @override
  List<Object> get props => [idDetailNutribution,idFood,idNutri];
}