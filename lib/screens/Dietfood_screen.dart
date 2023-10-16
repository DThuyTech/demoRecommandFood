
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodapp/Database/Dataservice/Dataservice.dart';
import 'package:foodapp/models/Viewmodel/Dailymenu.dart';
import 'package:foodapp/models/user.dart';
import 'package:foodapp/screens/question_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Diet.dart';
import '../models/Viewmodel/FoodViewmodel.dart';
import 'detailfood.dart';

class Dietfood_screen extends StatefulWidget {

  const Dietfood_screen({super.key,required this.dailyMenu});
  final DailyMenu dailyMenu;

  @override
  State<Dietfood_screen> createState() => _Dietfood_screen();
}

class _Dietfood_screen extends State<Dietfood_screen>{
  late Dataservice handler;
  bool LoadingScreen = false;
  String Dailypress = "monday";
  double widthOfbutton = 10.4;
  @override
  void initState()  {
    super.initState();


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
      body:  SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                  )
                ],
                color: Color.fromRGBO(242, 242, 242, 1),
              ),
              child: Text('Diet for one day'),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(()  async {
                        Dailypress = "monday";

                      });
                    },
                    child: Container(
                      width: Dailypress == "monday"?100:30 ,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                      child: Text(
                        Dailypress == "monday"? "Monday":"1",
                        style: TextStyle(
                          color: Color.fromRGBO(93, 123, 111, 1),
                        ),
                      ),
                    ),

                  ),
                 SizedBox(width: 10),

                  GestureDetector(
                    onTap: ()  {
                      // var dtat = await GetPref();
                      // print("testdata");
                      // print('$dtat');

                      setState(()  {
                        Dailypress = "tuesday";

                      });
                    },
                    child: Container(
                      width: Dailypress == "tuesday"?100:30 ,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                      child: Text(
                        Dailypress == "tuesday"?"Tuesday":"2",
                        style: TextStyle(
                          color: Color.fromRGBO(93, 123, 111, 1),
                        ),
                      ),
                    ),

                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Dailypress = "wednesday";
                      });
                    },
                    child: Container(
                      width: Dailypress == "wednesday"?100:30 ,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                      child: Text(
                        Dailypress == "wednesday"?"Wednesday":"3",
                        style: TextStyle(
                          color: Color.fromRGBO(93, 123, 111, 1),
                        ),
                      ),
                    ),

                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Dailypress = "thursday";
                      });
                    },
                    child: Container(
                      width: Dailypress == "thursday"?100:30,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                      child: Text(
                        Dailypress == "thursday"?"thursday":"4",
                        style: TextStyle(
                          color: Color.fromRGBO(93, 123, 111, 1),
                        ),
                      ),
                    ),

                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Dailypress = "friday";
                      });                    },
                    child: Container(
                      width: Dailypress == "friday"?100:30,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                      child: Text(
                          Dailypress == "friday"?"Friday":"5",
                        style: TextStyle(
                          color: Color.fromRGBO(93, 123, 111, 1),
                        ),
                      ),
                    ),

                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Dailypress = "saturday";
                      });                    },
                    child: Container(
                      width: Dailypress == "saturday"?100:30,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                      child: Text(
                          Dailypress == "saturday"?"Saturday":"6",
                        style: TextStyle(
                          color: Color.fromRGBO(93, 123, 111, 1),
                        ),
                      ),
                    ),

                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Dailypress = "sunday";
                      });                    },
                    child: Container(
                      width: Dailypress == "sunday"?100:30,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                      child: Text(
                          Dailypress == "sunday"?"Sunday":"7",
                        style: TextStyle(
                          color: Color.fromRGBO(93, 123, 111, 1),
                        ),
                      ),
                    ),

                  ),






                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 700,
              height: 830,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
             child: Container(
               alignment: Alignment.topLeft,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     width:  MediaQuery.of(context).size.width-20,
                     alignment: Alignment.centerLeft,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,

                       children: [
                         SizedBox(height: 20),
                         Container(
                           decoration : BoxDecoration(
                             color: Colors.grey,
                             borderRadius: BorderRadius.circular(10),
                           ),
                           child:Row(
                             children: [
                               Text("Breakfast",
                                 style: TextStyle(
                                   color: Colors.white,

                                 ),
                               ),
                               SizedBox(width: 20),
                               Container(
                                 width: 6,
                                 height: 18,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color : Colors.white,
                                 ),
                               ),
                               SizedBox(width: 20),
                               Container(
                                 width: 20,
                                 child:  Text(

                                   widget.dailyMenu!.menus[Dailypress]!.breakfast.length.toString().trim(),
                                 style: TextStyle(
                                   color :Colors.white,
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold,
                                 ),),

                               )

                             ],
                           )  ,
                           padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                         ),
                         SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Column(

                             children: [

                               SizedBox(height: 10),
                               Row(

                                 children: [

                                   ...widget.dailyMenu!.menus[Dailypress]!.breakfast.map((item) => buildermenuItem(item)),

                                 ],
                               ),
                               SizedBox(height: 10),


                             ],
                           ) ,
                         ),
                         Container(
                           height: 10,
                           width:  MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             color: Color.fromRGBO(242, 242, 242, 1),
                             borderRadius: BorderRadius.circular(10),
                           ),
                         ),
                       ],
                     )

                   ),
                   Container(
                       width:  MediaQuery.of(context).size.width-20,
                       alignment: Alignment.centerLeft,
                       child: Column(

                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,

                         children: [
                           SizedBox(height: 10),
                           Container(
                             decoration : BoxDecoration(
                               color: Colors.grey,
                               borderRadius: BorderRadius.circular(10),
                             ),
                             child:Row(
                               children: [
                                 Text("Lunch",
                                   style: TextStyle(
                                     color: Colors.white,

                                   ),
                                 ),
                                 SizedBox(width: 20),
                                 Container(
                                   width: 6,
                                   height: 18,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     color : Colors.white,
                                   ),
                                 ),
                                 SizedBox(width: 20),
                                 Container(
                                   width: 20,
                                   child:  Text(

                                     widget.dailyMenu!.menus[Dailypress]!.lunch.length.toString().trim(),
                                     style: TextStyle(
                                       color :Colors.white,
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold,
                                     ),),

                                 )

                               ],
                             ),
                             padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                           ),
                           SingleChildScrollView(
                             scrollDirection: Axis.horizontal,
                             child: Column(

                               children: [

                                 SizedBox(height: 10),
                                 Row(

                                   children: [

                                     ...widget.dailyMenu!.menus[Dailypress]!.lunch.map((item) => buildermenuItem(item)),

                                   ],
                                 ),
                                 SizedBox(height: 10),


                               ],
                             ) ,
                           ),
                           Container(
                             height: 10,
                             width:  MediaQuery.of(context).size.width,
                             decoration: BoxDecoration(
                               color: Color.fromRGBO(242, 242, 242, 1),
                               borderRadius: BorderRadius.circular(10),
                             ),
                           ),
                         ],
                       )

                   ),
                   Container(
                       width:  MediaQuery.of(context).size.width-20,
                       alignment: Alignment.centerLeft,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,

                         children: [
                           SizedBox(height: 10),
                           Container(
                             decoration : BoxDecoration(
                               color: Colors.grey,
                               borderRadius: BorderRadius.circular(10),
                             ),
                             child: Row(
                               children: [
                                 Text("Dinner",
                                   style: TextStyle(
                                     color: Colors.white,

                                   ),
                                 ),
                                 SizedBox(width: 20),
                                 Container(
                                   width: 6,
                                   height: 18,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     color : Colors.white,
                                   ),
                                 ),
                                 SizedBox(width: 20),
                                 Container(
                                   width: 20,
                                   child:  Text(

                                     widget.dailyMenu!.menus[Dailypress]!.dinner.length.toString().trim(),
                                     style: TextStyle(
                                       color :Colors.white,
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold,
                                     ),),

                                 )

                               ],
                             ),
                             padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                           ),
                           SingleChildScrollView(
                             scrollDirection: Axis.horizontal,
                             child: Column(

                               children: [

                                 SizedBox(height: 10),
                                 Row(

                                   children: [

                                     ...widget.dailyMenu!.menus[Dailypress]!.dinner.map((item) => buildermenuItem(item)),

                                   ],
                                 ),
                                 SizedBox(height: 10),


                               ],
                             ) ,
                           ),
                           Container(
                             height: 10,
                             width:  MediaQuery.of(context).size.width,
                             decoration: BoxDecoration(
                               color: Color.fromRGBO(242, 242, 242, 1),
                               borderRadius: BorderRadius.circular(10),
                             ),
                           ),
                         ],
                       )

                   ),




                 ],
               ),
             ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                 child: ElevatedButton(

                   onPressed: (){
                     Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => QuestionScreen(),
                     ));
                   },
                   child :Container(
                     padding:  EdgeInsets.all(10),
                     child: Text("Change"),
                   ),
                 ),
                )
              ],
            )
          ],
        ),
      ),

    );
  }
  Widget buildermenuItem(FoodViewmodel foodViewmodel){
    return    Container(
      height: 180,
      width: 400,
      child: Stack(
        children: [
          Positioned(
            top: 95,
            right  : 0,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Fooddetail(foodViewmodel: foodViewmodel),
                ));
              },
              child: Container(
                width: 150,

                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(100, 165 , 135, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 20),

                    Text("Recipe",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
            )

          ),
          Positioned(
            top: 0,
            right: 0,
            left : 0,
            child:    Container(
              height: 160,
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 80,
                    child: Container(
                      padding: EdgeInsets.only(left: 70),
                      width: 280,
                      height: 90,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                          )
                        ],
                        color: Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                foodViewmodel.name,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(68, 107, 80, 1)
                                ),
                              ),

                              IconButton(
                                icon :Icon(Icons.radio_button_unchecked),
                                onPressed: (){},
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(  foodViewmodel.calories.toString(),
                                style: TextStyle(
                                  color: Color.fromRGBO(68, 107, 80, 1),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,

                                ),

                              ),
                              Text('  Kcal',
                                style: TextStyle(
                                  color: Color.fromRGBO(68, 107, 80, 1),
                                  fontSize: 12,
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 15,
                            )
                          ],
                          borderRadius: BorderRadius.circular(75),
                        ),
                        child:  CircleAvatar(

                          backgroundImage: NetworkImage(foodViewmodel.imageUrl),
                          radius: 50,
                        ),
                      )),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
  void PressDayly(String day){
    setState(() {
      Dailypress = day;
    });
  }
  Future<String> GetPref () async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('dataFood').toString();
  }
  Future<int> addDiet() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.get('dataFood').toString() != null) {
      Diet diet = new Diet(1, prefs.get('dataFood').toString(), 1);
      List<Diet> diets = [diet, diet];
      return await this.handler.insertDiet(diets);
    }
    else{
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => QuestionScreen(),
      ));
    }
    return 0;
  }


}
