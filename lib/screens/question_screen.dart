import 'dart:convert';
import 'dart:io';
import 'package:foodapp/Database/Dataservice/Dataservice.dart';
import 'package:foodapp/models/Diet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/models/Foods.dart';
import 'package:foodapp/models/Viewmodel/Dailymenu.dart';
import 'package:foodapp/models/Viewmodel/FoodMeals.dart';
import 'package:foodapp/models/Viewmodel/FoodViewmodel.dart';
import 'package:foodapp/models/food.dart';
import 'package:foodapp/models/user.dart';
import 'package:foodapp/screens/Dietfood_screen.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Viewmodel/ListFood.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreen();
}

Map<String, int> activityintensity = {
  'One in week': 1,
  '2-3 in week': 2,
  '>4 in week': 3,
};
Map<String, int> mainColor = {
  'Bright': 1,
  'Dark': 2,
};

Map<String, int> Tastechoose = {
  'salty': 2,
  'sweet': 1,
  'sour': 5,
  'spice': 3,
  'bitter': 4,
};

// List<String> mainColor = <String>[
//   'Bright',
//   'Dark',
// ];
// List<String> tastechoose = <String>[
//   'salty',
//   'sweet',
//   'sour',
//   'spice',
//   'bitter',
//
// ];
class _QuestionScreen extends State<QuestionScreen> {

  DailyMenu? dailyMenu;
  late Dataservice handler;
  // Future<User?> fetchData() async {
  //   final response =
  //       await http.get(Uri.parse('http://foodtureapi.somee.com/api/Account/1'));
  //
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = json.decode(response.body);
  //     final User user = User(
  //       idUser: data['idUser'],
  //       email: data['emailAddress'],
  //       password: data['password'],
  //       weigh: data['weight'],
  //       heigh: data['heigh'],
  //       gender: data['gender'],
  //       idRole: data['idRole'],
  //       age: data['age'],
  //       avatar: data['avatar'],
  //       name: data['emailAddress'],
  //     );
  //     return user;
  //     // return User.fromjson(data);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
  Map<String, String> answerUserforNitrubution = {
    'Active': '0',
    'MainColor': '0',
    'Taste': '0',
  };
  Map<String, String> answerUserforPurpose = {
    'Smell': '0',
    'PartBody': '0',
    'Weigh': '0',
  };

  String activityintensityValue = activityintensity.keys.first;
  String tasteValue = Tastechoose.keys.first;
  String maincolorValue = mainColor.keys.first;
  bool ExplainingButton = false;
  List<FoodViewmodel> foodViewmodelre = [];
  User usercurrent = User(
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
  @override
  void initState() {
    super.initState();
    fetchData();
    this.handler = Dataservice();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(64, 64, 64, 1),

      appBar: AppBar(
        leading: BackButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          )),
        ),
        backgroundColor: Colors.transparent,
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: RichText(
      //     text: const TextSpan(
      //       style: TextStyle(
      //         fontSize: 25,
      //         fontWeight: FontWeight.w700,
      //         color: Colors.blue,
      //       ),
      //       children: <TextSpan>[
      //         TextSpan(text: 'FOO'),
      //         TextSpan(text: 'TURE', style: TextStyle(color: Colors.green)),
      //       ],
      //     ),
      //   ),
      //   titleSpacing: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.menu),
      //     onPressed: () {
      //       print("Biểu tượng danh sách đã được nhấn.");
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
                child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(
                    "QUESTION",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 10,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(231, 230, 230, 1),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 250,
                    child: Text(
                      "these are some question to identify what suitable food for you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 270,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 20,
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(242, 242, 242, 1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 10.0,
                                    offset: Offset.zero,
                                  )
                                ]),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Activity intensity',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    DropdownButton(
                                      underline: Container(
                                        color: Colors.transparent,
                                      ),
                                      value: activityintensityValue,
                                      icon: Icon(Icons.arrow_drop_down_circle),
                                      elevation: 16,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                      ),
                                      items: activityintensity.keys
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          activityintensityValue = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Main color',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    DropdownButton(
                                      underline: Container(
                                        color: Colors.transparent,
                                      ),
                                      value: maincolorValue,
                                      icon: Icon(Icons.arrow_drop_down_circle),
                                      elevation: 16,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                      ),
                                      items: mainColor.keys
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          maincolorValue = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Taste',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    DropdownButton(
                                      underline: Container(
                                        color: Colors.transparent,
                                      ),
                                      value: tasteValue,
                                      icon: Icon(Icons.arrow_drop_down_circle),
                                      elevation: 16,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                      ),
                                      items: Tastechoose.keys
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          tasteValue = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        ExplainingButton = true;
                                      });
                                    },
                                    icon: Icon(Icons.details),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(242, 242, 242, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 10.0,
                                    offset: Offset.zero,
                                  )
                                ]),
                            child: Text('for nutribution'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 270,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 20,
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(164, 195, 162, 1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 10.0,
                                    offset: Offset.zero,
                                  )
                                ]),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Smell',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    ),
                                    DropdownButton(
                                      underline: Container(
                                        color: Colors.transparent,
                                      ),
                                      value: activityintensityValue,
                                      icon: Icon(Icons.arrow_drop_down_circle),
                                      elevation: 16,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 13,
                                      ),
                                      items: activityintensity.keys
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          activityintensityValue = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Weight',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    ),
                                    DropdownButton(
                                      underline: Container(
                                        color: Colors.transparent,
                                      ),
                                      value: activityintensityValue,
                                      icon: Icon(Icons.arrow_drop_down_circle),
                                      elevation: 16,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 13,
                                      ),
                                      items: activityintensity.keys
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          activityintensityValue = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Body part',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    ),
                                    DropdownButton(
                                      underline: Container(
                                        color: Colors.transparent,
                                      ),
                                      value: activityintensityValue,
                                      icon: Icon(Icons.arrow_drop_down_circle),
                                      elevation: 16,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 13,
                                      ),
                                      items: activityintensity.keys
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          activityintensityValue = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    onPressed: () {
                                      ExplainingButton = true;
                                    },
                                    icon: Icon(Icons.details),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(68, 107, 80, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 10.0,
                                    offset: Offset.zero,
                                  )
                                ]),
                            child: Text(
                              'for purpose',
                              style: TextStyle(
                                color: Color.fromRGBO(204, 204, 204, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(150, 150, 150, 1),
                        )),
                        onPressed: () {
                          setState(() {
                            answerUserforNitrubution['Active'] =
                                activityintensity[
                                        activityintensityValue.toString()]
                                    .toString();
                            answerUserforNitrubution['Taste'] =
                                Tastechoose[tasteValue].toString();
                            answerUserforNitrubution['MainColor'] =
                                mainColor[maincolorValue].toString();
                            fetchDataFooddata();
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                          child: Text(
                            "DONE",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                  SizedBox(height: 10)
                ],
              ),
            )),
            Positioned(
              left: 0,
              right: 0,
              bottom: ExplainingButton ? 0 : -350,
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(93, 123, 111, 1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    )),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(242, 242, 242, 1),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 40),
                            Text(
                              'Explain',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(width: 20),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  ExplainingButton = false;
                                });
                              },
                              icon: Icon(Icons.arrow_drop_down),
                            )
                          ],
                        )),
                    SizedBox(height: 15),
                    Container(
                      height: 285,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Activity intensity",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Examples of different photos with automatically obtained primary colors (palette in the right side) on this website:',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Main color",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Examples of different photos with automatically obtained primary colors (palette in the right side) on this website:',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Taste",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Examples of different photos with automatically obtained primary colors (palette in the right side) on this website:',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Activity intensity",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Examples of different photos with automatically obtained primary colors (palette in the right side) on this website:',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> fetchDietFood() async{
  //   String jsonString  = await rootBundle.loadString('assets/foodslistoneday.json');
  //   List<Map<String, dynamic>> jsonDataList = json.decode(jsonString);
  //   List<FoodMeals> meals =jsonDataList.map((jsonDataList){
  //     return Foods(
  //       id: foodJson['id'],
  //       name: foodJson['name'],
  //       calories: foodJson['calories'].toDouble(),
  //       protein: foodJson['protein'].toDouble(),
  //       carbohydrates: foodJson['carbohydrates'].toDouble(),
  //       fat: foodJson['fat'].toDouble(),
  //       imageUrl: foodJson['imageUrl'],
  //     );
  //     ).toList(),
  //   })
  //
  //
  //   //mel
  //   List<FoodMeals> foodmeals = [];
  //   List<String> meals = ["breakfast","lunch","dinner"];
  //   // for(int i = 0 ;i< 3;i++){
  //   //
  //   //   String names = meals[0];
  //   //   List<Foods> foodfromdata = [];
  //   //   double fat = double.parse(data[1]["fat"].toString());
  //   //
  //   //   for(var fooditem in data){
  //   //     double fat = double.parse(fooditem["breakfast"]["fat"].toString());
  //   //     double calories = double.parse(fooditem["calories"].toString());
  //   //     double carbohydrates = double.parse(fooditem["carbohydrates"].toString());
  //   //     double protein = double.parse(fooditem["protein"].toString());
  //   //     int idfood = int.parse(fooditem["id"].toString());
  //   //     String name = fooditem["name"].toString();
  //   //     Foods food = new Foods(
  //   //         idFood: idfood,
  //   //         name: name,
  //   //         fat: fat,
  //   //         calories: calories,
  //   //         cacbonhydrat: carbohydrates,
  //   //         protein: protein,
  //   //         countlike: 0);
  //   //     foodfromdata.add(food);
  //   //   }
  //   // }
  //
  //
  // }
  Future<void> fetchDataFooddata() async {
    String mainColorchose = answerUserforNitrubution['MainColor'].toString();
    String activityChoose = answerUserforNitrubution['Active'].toString();
    String tasteChoose = answerUserforNitrubution['Taste'].toString();

    DailyMenu? dailyMenus;
    // http://foodtureapi.somee.com/api/Health/menu?age=21&weigh=65&heigh=170&gender=true&activity=1&target=2&colorMain=1&taste=2&ActivityDen=1&EmotionSen=1
    final respone = await http.get(Uri.parse(
        "http://foodtureapi.somee.com/api/Health/menu?age=${usercurrent.age.toString().trim()}&weigh=${usercurrent.weigh.toString().trim()}&heigh=${usercurrent.heigh.toString().trim()}&gender=${usercurrent.gender.toString().trim()}&activity=$activityChoose&target=2&colorMain=$mainColorchose&taste=$tasteChoose&ActivityDen=2&EmotionSen=1"));
    if (respone.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(respone.body);
      final Map<String, dynamic>? menusofUser =
          data["menus"] as Map<String, dynamic>?;
      dailyMenus = DailyMenu.fromJson(menusofUser);
      String? jsData = respone.body;
      WriteFilejson(jsData);
      var newString = await GetPref();
      print('$newString');
      Diet dietUser = new Diet(1 , respone.body, usercurrent.idUser as int);
      List<Diet> listDiet = [dietUser];
      this.handler.iniializedDB().whenComplete(() async{
        await this.handler.deleteDiet(1);
        await this.handler.insertDiet(listDiet);
      });
      //add to sqlite


     

    }
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Dietfood_screen(dailyMenu: dailyMenus!),
    ));
    //   // return User.fromjson(data);
    // } else {

    // }
  }

  void WriteFilejson(String jsonData) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('dataFood', jsonData);
  }

  Future<String> GetPref() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('dataFood').toString();
  }

  Future<void> fetchData() async {
    try {
      final SharedPreferences dataSource =
          await SharedPreferences.getInstance();
      String userdata = await dataSource.getString('user') as String;
      Map<String, dynamic> userencode = jsonDecode(userdata);
      setState(() {
        usercurrent = User.fromJson(userencode);
      });

      print(usercurrent.email);
    } catch (e) {
      print("null");
    }
  }
}
