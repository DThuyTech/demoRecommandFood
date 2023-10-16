import 'package:flutter/material.dart';
import 'package:foodapp/screens/Dietfood_screen.dart';
import 'package:foodapp/screens/ListFood_Screen.dart';
import 'package:foodapp/screens/care_screen.dart';
import 'package:foodapp/screens/food_screen.dart';
import 'package:foodapp/screens/home_screen.dart';
import 'package:foodapp/screens/login_screen.dart';
import 'package:foodapp/screens/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodapp/screens/register_screen.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Ẩn chữ "DEBUG"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 3;
  final bool _checkLogin = false;
  // List<String> pageTitles = ['Home', 'User', 'Setting'];
  List<Widget> pages = [
    const HomeScreen(),
    const FoodScreen(),
    const CareScreen(),
    const ListFood_Screen(),
    // const ProflieScreen(),
    // const QuestionScreen()
    // const LoginScreen()
    // const Register_screen()
    // const Fooddetail(),
    // const RecipeScreen()
    // const Dietfood_screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: _checkLogin ? const LoginScreen() : pages[_currentIndex],
        ),
        bottomNavigationBar: _checkLogin
            ? null
            : BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                items: const [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: 'Food',
                    icon: Icon(Icons.restaurant_menu),
                  ),
                  BottomNavigationBarItem(
                    label: 'Cart',
                    icon: Icon(Icons.shopping_cart),
                  ),
                  BottomNavigationBarItem(
                    label: 'Setting',
                    icon: Icon(Icons.person),
                  ),
                ],
              ));
  }
}
