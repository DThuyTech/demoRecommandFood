import 'package:equatable/equatable.dart';

class Statebody extends Equatable{
  int idState;
  String name;
  String desciption;

  Statebody(this.idState, this.name, this.desciption);
  @override
  List<Object> get props => [idState,name,desciption];
  static fromjson(model) {}
}