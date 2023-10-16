import 'dart:convert';
import 'dart:io';
import 'package:foodapp/screens/login_screen.dart';
import 'package:foodapp/screens/profile_screen.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:foodapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Register_screen extends StatefulWidget {
  const Register_screen({Key? key}) : super(key: key);

  @override
  State<Register_screen> createState() => _Register_screenState();
}

class _Register_screenState extends State<Register_screen> {

    FocusNode _focusNode1 = FocusNode();
    FocusNode _focusNode2 = FocusNode();
    FocusNode _focusNode3 = FocusNode();
    final email = TextEditingController();
    final password = TextEditingController();
    final Confirmpassword = TextEditingController();
    bool visibil = true;

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      super.dispose();
      _focusNode2.dispose();
      _focusNode1.dispose();
      _focusNode3.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(
              child:SingleChildScrollView(
                  child: Column(
                    children: [
                      logo(),
                      SizedBox(height: 0),
                      textfild(),
                      SizedBox(height: 15),
                      textfild2(),
                      SizedBox(height: 15),
                      textfild3(),
                      SizedBox(height: 8),
                      have(),
                      SizedBox(height: 20),
                      signIN(),

                      SizedBox(height: 15),
                      or(),
                      // SizedBox(height: 15),
                      // WithGoogle(),
                      SizedBox(height: 10),
                      WithApple(),
                    ],
                  ),
                ),

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
                'images/google.png',
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

    Padding have() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "have an account?  ",
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Text(
                "Sign IN",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }
    Future<void> _dialogBuilder(BuildContext context, String message) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Error',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            content: Text(message, style: TextStyle(fontSize: 17)),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    Padding textfild() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: TextStyle(fontSize: 18, color: Colors.black),
            controller: email,
            focusNode: _focusNode1,
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(
                Icons.email,
                color: _focusNode1.hasFocus ? Colors.black : Colors.grey[600],
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                ),
              ),
            ),
          ),
        ),
      );
    }

    Padding textfild2() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: TextStyle(fontSize: 18, color: Colors.black),
            controller: password,
            focusNode: _focusNode2,
            obscureText: visibil,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(
                Icons.key,
                color: _focusNode2.hasFocus ? Colors.black : Colors.grey[600],
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                ),
              ),
            ),
          ),
        ),
      );
    }
    Padding signIN() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GestureDetector(
          onTap: () {
            SignUp();
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
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
          ),
        ),
      );
    }
  Future<void> SignUp() async {
      if(email.text != '' && password.text!=''&& Confirmpassword.text != ''){
        if(password.text.compareTo(Confirmpassword.text) == 0){
          final User  userSignup = new User(idUser: 0, email: email.text.trim(), password: password.text.trim(), weigh: 0 , heigh: 0, gender: true, idRole: 1, age: 0, avatar: 'avatar', name: 'Yourname');
          var params = {
            "idUser" : 0,
            "name" : "Yourname",
            "emailAddress" : email.text.trim(),
            "password" :password.text.trim(),
            "weigh" : 70,
            "heigh" :170,
            "gender" : true,
            "age":20,
            "avatar":"avatar",
            "idRole":1,
          };
          try{
            final jsonString = json.encode(params);
             Uri uri = await Uri.parse('http://foodtureapi.somee.com/api/Account/register');
            int i = 0;
            final headers =await {HttpHeaders.contentTypeHeader: 'application/json'};
            print(uri);
            print(jsonString);
            final response = await http.post(uri,headers: headers,body: jsonString);
            if(response.statusCode == 200){
              print("success");
            }
            else{
              print(response.statusCode);
            }
          }catch  (e) {
            print(e.toString());
          }


          final respone = await http.post(Uri.parse('http://foodtureapi.somee.com/api/Account/Login?username=${email.text.trim()}&password=${password.text.trim()}'));
          if (respone.statusCode == 200) {
            final Map<String, dynamic> jsonData = jsonDecode(respone.body);
            final User user = User.fromJson(jsonData);


          }
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('user',respone.body);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProflieScreen(),
            ),
          );
        }
      }
  }
    Padding textfild3() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: TextStyle(fontSize: 18, color: Colors.black),
            controller: Confirmpassword,
            focusNode: _focusNode3,
            obscureText: visibil,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      visibil = !visibil;
                    });
                  },
                  child: Icon(
                    visibil ? Icons.visibility_off : Icons.visibility,
                    color: _focusNode3.hasFocus ? Colors.black : Colors.grey[600],
                  )),
              hintText: 'Password Confirm',
              prefixIcon: Icon(
                Icons.key,
                color: _focusNode3.hasFocus ? Colors.black : Colors.grey[600],
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                ),
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

}
