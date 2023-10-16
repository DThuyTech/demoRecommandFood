import 'package:equatable/equatable.dart';

class DetailDietFood extends Equatable{
  int idFood;
  int idDiet;
  int idDetailDietFood;
  DateTime dateTime;
  int bref;

  DetailDietFood({required this.idFood,required this.idDiet,required this.idDetailDietFood,required this.dateTime,
    required  this.bref});
  @override
  List<Object> get props => [idFood, idDiet,idDetailDietFood,dateTime,bref];
}