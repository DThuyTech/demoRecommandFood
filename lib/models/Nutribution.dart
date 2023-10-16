import 'package:equatable/equatable.dart';

class Nutribution extends Equatable{
  int idNutribution;
  String name;
  String description;

  Nutribution(this.idNutribution, this.name, this.description);
  @override
  List<Object> get props => [idNutribution,name,description];
}