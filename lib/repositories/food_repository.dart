// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = '';
final localUrl = (food) => '$baseUrl/api/....../?query=$food';

class FoodRepository {
  final http.Client httpClient;
  //contructor
  FoodRepository({required this.httpClient});
  Future<List> getListFoodId(String food) async {
    final respose = await httpClient.get(localUrl(food) as Uri);
    if (respose.statusCode == 200) {
      final foods = jsonDecode(respose.body) as List;
      return foods;
    } else {
      throw Exception('Error getting food of :$food');
    }
  }
}
