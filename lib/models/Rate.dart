import 'package:equatable/equatable.dart';

class Rate extends Equatable{
  int idFood;
  int idFoodpart;
  int rate;
  int idRate;

  Rate({required this.idFood,required this.idFoodpart,required this.rate,required this.idRate});
  @override
  List<Object> get props => [idFood,idFoodpart,rate,idRate];
}