import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodapp/models/user.dart';
import 'package:http/http.dart' as http;

class CareScreen extends StatefulWidget {
  const CareScreen({Key? key}) : super(key: key);

  @override
  State<CareScreen> createState() => _CareScreenState();
}

class _CareScreenState extends State<CareScreen> {
  Future<User?> fetchData() async {
    final response =
        await http.get(Uri.parse('http://foodtureapi.somee.com/api/Account/1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final User user = User(
        idUser: data['idUser'],
        email: data['emailAddress'],
        password: data['password'],
        weigh: data['weight'],
        heigh: data['heigh'],
        gender: data['gender'],
        idRole: data['idRole'],
        age: data['age'],
        avatar: data['avatar'],
        name: data['emailAddress'],
      );
      return user;
      // return User.fromjson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.blue,
            ),
            children: <TextSpan>[
              TextSpan(text: 'FOO'),
              TextSpan(text: 'TURE', style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            print("Biểu tượng danh sách đã được nhấn.");
          },
        ),
      ),
      body: FutureBuilder<User?>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final user = snapshot.data;

            if (user == null) {
              return const Center(
                child: Text('No data available'),
              );
            }

            return SafeArea(
              child: Center(
                child: Text('CARE - User Name: ${user.name}'),
              ),
            );
          }
        },
      ),
    );
  }
}
