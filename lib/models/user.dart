import 'package:equatable/equatable.dart';

class User extends Equatable {
  int? idUser = 0;
  String? email;
  String? password;
  double? weigh;
  double? heigh;
  bool? gender;
  int? idRole;
  int? age;
  String? avatar;
  String? name;
  User(
      {required this.idUser,
      required this.email,
      required this.password,
      required this.weigh,
      required this.heigh,
      required this.gender,
      required this.idRole,
      required this.age,
      required this.avatar,
      required this.name});

  @override
  List<Object?> get props =>
      [idUser, email, password, weigh, heigh, gender, age, avatar, name];
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['idUser'] as int?,
      email: json['emailAddress'] as String?,
      password: json['password'] as String?,
      weigh: double.parse( json['weigh'].toString()),
      heigh: double.parse( json['heigh'].toString()),
      gender: json['gender'] as bool?,
      idRole: json['idRole'] as int?,
      age: json['age'] as int?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
    );
  }
}
