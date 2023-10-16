import 'dart:convert';
import 'dart:ui';
import 'package:foodapp/Database/Dataservice/Dataservice.dart';
import 'package:foodapp/models/Viewmodel/Dailymenu.dart';
import 'package:foodapp/screens/Dietfood_screen.dart';
import 'package:foodapp/screens/question_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:foodapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../models/Diet.dart';
import 'Chart/ChartContainer_Widget.dart';
import 'Chart/ChartType/Linearchart.dart';
import 'editprofile_screen.dart';

class ProflieScreen extends StatefulWidget {
  const ProflieScreen({Key? key}) : super(key: key);

  @override
  State<ProflieScreen> createState() => _ProflieScreenState();
}

class _ProflieScreenState extends State<ProflieScreen> {
  bool Loading = false  ;
  late  Dataservice handler;
  final double _with = 330;
  int editting = 0;
  final double _withediting = 0;
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
  String   BMI = "";
  String BMR = "9999";
  @override

  void initState() {
    super.initState();
    handler = Dataservice();
    fetchData();
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
                children: [
                  const SizedBox(height: 20),
                   Text(
                    usercurrent.name.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.yellow,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.2),
                    child: IconButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.transparent),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      iconSize: 20,
                      color: Colors.limeAccent,
                      hoverColor: Colors.lightGreenAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Stack(

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: _with +10 ,
                        decoration: BoxDecoration(
                          color: const Color(0XFFF1F8E9),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Stack(

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5),
                                      Text("email :"),
                                      SizedBox(height: 5),
                                      Text("heigh :"),
                                      SizedBox(height: 5),
                                      Text("weigh :"),
                                      SizedBox(height: 5),
                                      Text("gender :"),
                                      SizedBox(height: 5),
                                      Text("age :"),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5),
                                      Text(usercurrent.email.toString()),
                                      const SizedBox(height: 5),
                                      Text(usercurrent.heigh.toString()),
                                      const SizedBox(height: 5),
                                      Text(usercurrent.weigh.toString()),
                                      const SizedBox(height: 5),
                                      usercurrent.gender == true
                                          ? const Text("male")
                                          : const Text("female"),
                                      const SizedBox(height: 5),
                                      Text(usercurrent.age.toString()),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: IconButton(
                                  icon: const Icon(Icons.three_p_sharp),
                                  onPressed: () {
                                    Navigator.of(context).push(_createRoute());
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(

                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color :  Colors.transparent,

                      ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround ,

                          children: [
                            ElevatedButton(

                              onPressed: (){
                                NavigtoPage();
                              },
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all<Size>(
                                  Size(105,10),
                                )

                              ),
                              child: Text(
                                "Diet",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            ),

                            ElevatedButton(

                              onPressed: (){},
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                    Size(105,10),
                                  )

                              ),
                              child: Text(
                                "For 1 day",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                      const SizedBox(width: 5),
                      // if(editting == 1)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                  width: 335,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(100, 165, 135, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "BMI: ",
                        style: TextStyle(
                          color: Color.fromRGBO(226, 240, 217, 0.9),
                          fontSize: 10,
                          height: 0.8,
                        ),
                      ),
                      const SizedBox(height: 3),
                       Text(
                        BMI.toString(),
                        style: TextStyle(
                          height: 0.95,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(226, 240, 217, 0.9),
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        "NORMAL",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(226, 240, 217, 0.9),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0XFFF1F8E9),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Icon(
                                Icons.health_and_safety,
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                                size: 20,
                              ),
                              Text("BMR : "),
                              Text(
                                BMR.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text("Calories"),
                            ],
                          )),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0XFFF1F8E9),
                            ),
                            child: const Text(
                              "400",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 0.8),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0XFFF1F8E9),
                            ),
                            child: const Text(
                              "400",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 0.8),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0XFFF1F8E9),
                            ),
                            child: const Text(
                              "400",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  )),
              SizedBox(height: 10  ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 250 ,
                child:  ChartContainer(
                  title: 'Chart health',
                  color: Color.fromRGBO(93  , 123, 111, 1),
                  chart: LinearChartContent(),
                )
              )

            ],
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
           ProflieEditingScreen(userCurrent: usercurrent),
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
  Future<void> NavigtoPage() async {
    if(Loading == false) {
      showDialog(context: context, builder: (context) {
        return Center(child: CircularProgressIndicator());
      });
    }

    await handler.iniializedDB().whenComplete(() async{
      List<Diet> listDiet =  await handler.retrieveDiet();
      if(listDiet.length>0){
        String jsonDBFood = listDiet[0].stringjson;
        final Map<String,dynamic> data = json.decode(jsonDBFood);
        final Map<String, dynamic>? menusofUser =
        data["menus"] as Map<String, dynamic>?;
        DailyMenu dailyMenu = DailyMenu.fromJson(menusofUser);
        setState(() {
          Loading = true;
        });
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dietfood_screen(dailyMenu: dailyMenu),
        ));

      }
      else{
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => QuestionScreen(),
        ));
      }
    });
  }
  Route _createRouteDiet(DailyMenu dailyMenus)  {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
       Dietfood_screen(dailyMenu:  dailyMenus),
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

   // Future<User> fetchUser() async {
  //   const String url = 'http://foodtureapi.somee.com/api/Account/1';
  //   try {
  //     final respone = await http
  //         .get(Uri.parse('http://foodtureapi.somee.com/api/Account/1'));

  //     if (respone.statusCode == 200) {
  //       final Map<String, dynamic> jsonData = json.decode(respone.body);
  //       final User user = User(
  //         idUser: jsonData['idUser'],
  //         email: jsonData['emailAddress'],
  //         password: jsonData['password'],
  //         weigh: jsonData['weight'],
  //         heigh: jsonData['heigh'],
  //         gender: jsonData['gender'],
  //         idRole: jsonData['idRole'],
  //         age: jsonData['age'],
  //         avatar: jsonData['avatar'],
  //         name: jsonData['emailAddress'],
  //       );
  //       return user;
  //     } else {
  //       throw Exception('Failed to fetch user1');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to fetch users');
  //   }
  // }
  Future<void> fetchData() async {
    try{
      final SharedPreferences dataSource = await SharedPreferences.getInstance();
       String userdata =await dataSource.getString('user') as String;
      Map<String,dynamic> userencode =  jsonDecode(userdata);
      setState(() {
        usercurrent = User.fromJson(userencode);
      });

      print(usercurrent.email);
    }catch (e){
      print("null");
    }

    String BMIdata = "null",BMRdata ="null",BMIstatus = "null";

    try{
      final respone =
      await http.get(Uri.parse("http://foodtureapi.somee.com/api/Health/menu?age=${usercurrent.age.toString().trim()}&weigh=${usercurrent.weigh.toString().trim()}&heigh=${usercurrent.heigh.toString().trim()}&gender=${usercurrent.gender.toString().trim()}&activity=1&target=2&colorMain=1&taste=1&ActivityDen=2&EmotionSen=1"));
      if(respone.statusCode == 200) {
        final Map<String,dynamic> data = json.decode(respone.body);
        BMIdata = data["bmi"].toStringAsFixed(2);
        BMRdata = data["bmr"].toStringAsFixed(2);
        BMIstatus = data["bmiStatus"] as String;

      }
      setState(() {
        BMI = BMIdata;
        BMR = BMRdata;
      });
    }catch (e) {
      setState(() {
        BMI = "null";
        BMR = "null";
      });
    }
    // try {
    //   final response = await http.get(
    //     Uri.parse('http://foodtureapi.somee.com/api/Account/2'),
    //   );
    //
    //   if (response.statusCode == 200) {
    //     final Map<String, dynamic> jsonData = json.decode(response.body);
    //     final User user = User(
    //       idUser: jsonData['idUser'],
    //       email: jsonData['emailAddress'],
    //       password: jsonData['password'],
    //       weigh: jsonData['weigh'] ,
    //       heigh: jsonData['heigh'],
    //       gender: jsonData['gender'],
    //       idRole: jsonData['idRole'],
    //       age: jsonData['age'],
    //       avatar: jsonData['avatar'],
    //       name: jsonData['name'],
    //     );
    //
    //     setState(() {
    //       usercurrent = user;
    //     });
    //   } else {
    //     throw Exception('Failed to fetch user');
    //   }
    // } catch (e) {
    //   throw Exception('Failed to fetch user');
    // }
    //
    //
    // try {
    //   final responsedatabm = await http.get(
    //     Uri.parse('http://foodtureapi.somee.com/api/Health/bmi?id=2'),
    //
    //   );
    //   final responsedatabmr = await http.get(
    //     Uri.parse('http://foodtureapi.somee.com/api/Health/tdee?id=2'),
    //
    //   );
    //   if(responsedatabm.statusCode == 200){
    //     final dynamic jsonDt =json.decode(responsedatabm.body);
    //     setState(() {
    //       BMI = jsonDt.toStringAsFixed(2);
    //
    //
    //     });
    //   }
    //   if(responsedatabmr.statusCode == 200){
    //     final dynamic jsonDt =json.decode(responsedatabmr.body);
    //     setState(() {
    //       BMR = jsonDt.toStringAsFixed(2);
    //
    //
    //     });
    //   }
    // }catch(e){
    //   throw Exception('Failed to fetch user');
    //
    // } // try {
    //   final response = await http.get(
    //     Uri.parse('http://foodtureapi.somee.com/api/Account/2'),
    //   );
    //
    //   if (response.statusCode == 200) {
    //     final Map<String, dynamic> jsonData = json.decode(response.body);
    //     final User user = User(
    //       idUser: jsonData['idUser'],
    //       email: jsonData['emailAddress'],
    //       password: jsonData['password'],
    //       weigh: jsonData['weigh'] ,
    //       heigh: jsonData['heigh'],
    //       gender: jsonData['gender'],
    //       idRole: jsonData['idRole'],
    //       age: jsonData['age'],
    //       avatar: jsonData['avatar'],
    //       name: jsonData['name'],
    //     );
    //
    //     setState(() {
    //       usercurrent = user;
    //     });
    //   } else {
    //     throw Exception('Failed to fetch user');
    //   }
    // } catch (e) {
    //   throw Exception('Failed to fetch user');
    // }
    //
    //
    // try {
    //   final responsedatabm = await http.get(
    //     Uri.parse('http://foodtureapi.somee.com/api/Health/bmi?id=2'),
    //
    //   );
    //   final responsedatabmr = await http.get(
    //     Uri.parse('http://foodtureapi.somee.com/api/Health/tdee?id=2'),
    //
    //   );
    //   if(responsedatabm.statusCode == 200){
    //     final dynamic jsonDt =json.decode(responsedatabm.body);
    //     setState(() {
    //       BMI = jsonDt.toStringAsFixed(2);
    //
    //
    //     });
    //   }
    //   if(responsedatabmr.statusCode == 200){
    //     final dynamic jsonDt =json.decode(responsedatabmr.body);
    //     setState(() {
    //       BMR = jsonDt.toStringAsFixed(2);
    //
    //
    //     });
    //   }
    // }catch(e){
    //   throw Exception('Failed to fetch user');
    //
    // }
  }
}
