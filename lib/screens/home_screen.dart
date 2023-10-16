import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  color: Colors.blue),
              children: <TextSpan>[
                TextSpan(text: 'FOO'),
                TextSpan(text: 'TURE', style: TextStyle(color: Colors.green))
              ]),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            print("Biểu tượng danh sách đã được nhấn.");
          },
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('HOME'),
        ),
      ),
    );
  }
}
