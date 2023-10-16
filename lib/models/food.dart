import 'package:equatable/equatable.dart';

  class Food extends Equatable {
  final int id;
  final String name;
  final String email;
  final String password;

  const Food({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [id, name, email, password];

  static fromjson(model) {}
}
