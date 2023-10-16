import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:foodapp/models/user.dart';
import 'package:foodapp/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProflieEditingScreen extends StatefulWidget {
  const ProflieEditingScreen({super.key, required this.userCurrent});
  final User userCurrent;

  @override
  State<ProflieEditingScreen> createState() => _ProflieScreenState();
}

enum genders { male, female }

class _ProflieScreenState extends State<ProflieEditingScreen> {
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final weighcontroller = TextEditingController();
  final heightcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final double _with = 330;
  Color Colorborder = Colors.greenAccent;
  bool _validemail = false;
  bool _validheigh = false;
  bool _validweigh = false;
  bool _validage = false;
  genders? _character = genders.male;
  int editting = 0;
  final double _withediting = 0;
  @override
  initState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(64, 64, 64, 1),

      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: RichText(
      //     text: const TextSpan(
      //         style: TextStyle(
      //             fontSize: 25,
      //             fontWeight: FontWeight.w700,
      //             color: Colors.blue),
      //         children: <TextSpan>[
      //           TextSpan(text: 'FOO'),
      //           TextSpan(text: 'TURE', style: TextStyle(color: Colors.green))
      //         ]),
      //   ),
      //   titleSpacing: 0,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.menu,
      //       color: Colors.red,
      //     ),
      //     onPressed: () {
      //       print("Biểu tượng danh sách đã được nhấn.");
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  color: Colors.green,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/avatar.png"),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 300,
                    decoration: const BoxDecoration(),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: namecontroller,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(255, 242, 204, 1)),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hoverColor: Colors.yellow,
                        hintText: "Ho ten",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(255, 242, 204, 0.6)),
                      ),
                    ),
                  )

                  // Container(
                  //   padding: EdgeInsets.all(0.2),
                  //   child: IconButton(
                  //     style: const ButtonStyle(
                  //       backgroundColor:
                  //       MaterialStatePropertyAll<Color>(Colors.transparent),
                  //     ),
                  //     onPressed: () {},
                  //     icon: Icon(Icons.edit),
                  //     iconSize: 20,
                  //     color: Colors.limeAccent,
                  //     hoverColor: Colors.lightGreenAccent,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        padding: const EdgeInsets.only(left: 10),
                        width: _with,
                        decoration: BoxDecoration(
                          color: const Color(0XFFF1F8E9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.fastOutSlowIn,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5),
                                      Container(
                                        width: 270,
                                        decoration: const BoxDecoration(),
                                        child: TextField(
                                          textAlign: TextAlign.start,
                                          controller: emailcontroller,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hoverColor: Colors.yellow,
                                            hintText: "email : example@abc.com",
                                            errorText: _validemail
                                                ? 'Please enter your email'
                                                : null,
                                            hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.7)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 3, //<-- SEE HERE
                                                color: Colorborder,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: 270,
                                        decoration: const BoxDecoration(),
                                        child: TextField(
                                          textAlign: TextAlign.start,
                                          controller: weighcontroller,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hoverColor: Colors.yellow,
                                            hintText: "your weigh : 50",
                                            hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.7)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 3, //<-- SEE HERE
                                                color: Colors.greenAccent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        width: 270,
                                        decoration: const BoxDecoration(),
                                        child: TextField(
                                          textAlign: TextAlign.start,
                                          controller: heightcontroller,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hoverColor: Colors.yellow,
                                            hintText: "your heigh : 170",
                                            hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.7)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 3, //<-- SEE HERE
                                                color: Colors.greenAccent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text("Your gender"),
                                      Container(
                                        width: 300,
                                        child: Column(
                                          children: <Widget>[
                                            ListTile(
                                              title: const Text('male'),
                                              leading: Radio<genders>(
                                                value: genders.male,
                                                groupValue: _character,
                                                onChanged: (genders? value) {
                                                  setState(() {
                                                    _character = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            ListTile(
                                              title: const Text('female'),
                                              leading: Radio<genders>(
                                                value: genders.female,
                                                groupValue: _character,
                                                onChanged: (genders? value) {
                                                  setState(() {
                                                    _character = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      widget.userCurrent.gender == 0
                                          ? const Text("male")
                                          : const Text("female"),
                                      const SizedBox(height: 5),
                                      Container(
                                        width: 270,
                                        decoration: const BoxDecoration(),
                                        child: TextField(
                                          textAlign: TextAlign.start,
                                          controller: agecontroller,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hoverColor: Colors.yellow,
                                            hintText: "your age : 20",
                                            hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.7)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 3, //<-- SEE HERE
                                                color: Colors.greenAccent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      // if(editting == 1)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                              onPressed: () async {
                                CheckNull();
                                await UpdateProfile().whenComplete(() => {
                                  Navigator.of(context).push(_createRoute())
                                });

                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: const Text("update"),
                              )),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(100, 165, 135, 1))),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProflieScreen(),
                                ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void CheckNull() {
    emailcontroller.text.isEmpty ? _validemail = true : _validemail = false;

    weighcontroller.text.isEmpty ? _validweigh = true : _validweigh = false;
    heightcontroller.text.isEmpty ? _validheigh = true : _validheigh = false;
    agecontroller.text.isEmpty ? _validage = true : _validage = false;

    setState(() {
      _validemail ? Colorborder = Colors.red : Colorborder = Colors.greenAccent;
      _validheigh ? Colorborder = Colors.red : Colorborder = Colors.greenAccent;
      _validweigh ? Colorborder = Colors.red : Colorborder = Colors.greenAccent;
      _validage ? Colorborder = Colors.red : Colorborder = Colors.greenAccent;
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const ProflieScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future<void> setupUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? idUser = preferences.getString("user");
    widget.userCurrent.idUser = int.parse(idUser!.trim());
  }

  Future<void> UpdateProfile() async {
    if (_validweigh || _validage || _validheigh || _validemail) {
      print("fail");
    } else {
      var paramaster = {
        "idUser": widget.userCurrent.idUser,
        "name": namecontroller.text,
        "emailAddress": widget.userCurrent.email.toString().trim(),
        "password": widget.userCurrent.password,
        "weigh": weighcontroller.text.trim(),
        "heigh": heightcontroller.text.trim(),
        "gender": widget.userCurrent.gender,
        "age": agecontroller.text,
        "avatar": "string",
        "idRole": widget.userCurrent.idRole,
      };
      try {
        final jsonString = json.encode(paramaster);
        Uri uri = await Uri.parse(
            'http://foodtureapi.somee.com/api/Account/UpdateUser?idUser=${widget
                .userCurrent.idUser}');
        int i = 0;
        final headers =
        await {HttpHeaders.contentTypeHeader: 'application/json'};
        print(uri);
        print(jsonString);
        final response =
        await http.put(uri, headers: headers, body: jsonString);
        if (response.statusCode == 200) {
          final respone = await http.post(Uri.parse(
              'http://foodtureapi.somee.com/api/Account/Login?username=${widget
                  .userCurrent.email.toString().trim()}&password=${widget
                  .userCurrent.password.toString().trim()}'));
          if (respone.statusCode == 200) {
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('user', respone.body);
          }
        } else {
          print(response.statusCode);
        }
      } catch (e) {
        print(e.toString());
      }

    }
  }
}
