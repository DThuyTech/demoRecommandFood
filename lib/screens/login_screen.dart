import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodapp/models/user.dart';
import 'package:foodapp/screens/profile_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User  usercurrent = User(
      idUser: 1,
      email: 'email',
      password: 'password',
      weigh: 60,
      heigh: 1.75,
      gender: true,
      idRole: 2,
      age: 21,
      avatar: 'avatar',
      name: 'name');
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  final email = TextEditingController();
  final pass = TextEditingController();
  bool visible = true;
  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    pass.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
  }
  @override
  Widget build(BuildContext context) {
    CheckPassUer();
    return Scaffold(
        backgroundColor: Color.fromRGBO(164, 195, 162, 1),
        body: SafeArea(
           child: SingleChildScrollView(
                  child: Column(
                    children: [
                      logo(),
                      SizedBox(height:34),
                      textfild(),
                      SizedBox(height: 15),
                      textfild2(),

                      SizedBox(height: 20),
                      signIN(),


                      SizedBox(height:15),
                      or(),
                      // SizedBox(height: 15),
                      // WithGoogle(),
                      SizedBox(height:15),
                      WithApple(),
                    ],
                  )
              )

        )
    );
  }
  Padding WithGoogle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'assets/google.png',
              height: 30,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              'Continue with Google',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Padding WithApple() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Icon(
                Icons.apple,
                color: Colors.black,
              )),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              'Continue with Apple',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Padding logo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/foodlogo.png'),
            fit: BoxFit.cover
          )
        ),

      )
    );
  }

  textfild() {
    return Padding(
      padding :const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: TextStyle(fontSize: 18, color : Colors.black),
          controller: email,
          focusNode: _focusNode1,
          decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(
                Icons.email,
                color: _focusNode1.hasFocus ? Colors.black : Colors.grey[600],
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black,
                  )
              )
          ),
        ),
      ),
    );
  }
  Padding textfild2(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              style: TextStyle(fontSize: 18 , color : Colors.black),
              controller: pass,
              focusNode: _focusNode2,
              obscureText: visible,
              obscuringCharacter: '*' ,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          visible = !visible;
                        });
                      },
                      child: Icon(
                        visible ? Icons.visibility_off :Icons.visibility,
                        color: _focusNode2.hasFocus ? Colors.black : Colors.grey[300],
                      )
                  ),
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.key,
                    color: _focusNode2.hasFocus ? Colors.black : Colors.grey[600],

                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xffc5c5c5),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color:Colors.black,
                      )
                  )
              ),
            )
        )
    );

  }

  Padding signIN() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GestureDetector(
            onTap: (){
              SignInprosess();
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color:Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
        )
    );
  }

  Row or() {
    return Row(
      children: [
        Expanded(
            child: Divider(
              thickness: 1.5,
              endIndent: 4,
              indent: 20,
            )),
        Text(
          "OR",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        Expanded(
            child: Divider(
              thickness: 1.5,
              endIndent: 20,
              indent: 4,
            ))
      ],
    );
  }
  Future<void> SignInprosess() async {

    User usercurrent;
    if (email.text != '' && pass.text != '') {
      String emailuser = email.text;
      String passUser = pass.text;
      var paramater = {
        "username" : emailuser.trim(),
        "password" : passUser.trim(),
      };
      // final jsonStringlocal = jsonEncode(paramater);
      // final uri =Uri.http('foodtureapi.somee.com','/api/Account/Login?');
      // final hders = {HttpHeaders.contentTypeHeader : 'application/json'};
      final respone = await http.post(Uri.parse('http://foodtureapi.somee.com/api/Account/Login?username=${emailuser.trim()}&password=${passUser.trim()}'));
      if (respone.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(respone.body);
       final User user = User.fromJson(jsonData);
        setState(() {
          usercurrent = user;
        });
        //set user in memory
        SetUserSharedFer(user);
        
        
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', respone.body);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProflieScreen(),
          ),
        );
      }
      else{
        print("no");
      }
    }
  }

  Future<void> SetUserSharedFer (User usercrn) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", usercrn.idUser.toString());
    
  }
  Future<void> CheckPassUer () async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("user") != null){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ProflieScreen(),
        ),
      );
    }

  }
}

