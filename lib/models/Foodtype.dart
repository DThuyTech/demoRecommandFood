import 'package:equatable/equatable.dart';

class FoodTtype extends Equatable{
    int idFoodtype;
    String name;
    String description;

    FoodTtype(this.idFoodtype, this.name, this.description);
    @override
    List<Object> get props => [idFoodtype,name,description];

}