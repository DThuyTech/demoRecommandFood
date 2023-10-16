// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:foodapp/models/user.dart';
// import 'package:foodapp/screens/profile_screen.dart';
//
// class ProflieEditingScreen extends StatefulWidget {
//   const ProflieEditingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProflieEditingScreen> createState() => _ProflieScreenState();
// }
//
// class _ProflieScreenState extends State<ProflieEditingScreen> {
//   User usercurrent = User(
//       idUser: 0,
//       email: 'email',
//       password: 'password',
//       weigh: 0,
//       heigh: 0,
//       gender: 0,
//       idRole: 2,
//       age: 21,
//       avatar: 'avatar',
//       name: 'name');
//   final namecontroller = TextEditingController();
//   final agecontroller = TextEditingController();
//   final weighcontroller = TextEditingController();
//   final heightcontroller = TextEditingController();
//   final emailcontroller = TextEditingController();
//
//   double _with = 330;
//   int editting = 0;
//   double _withediting = 0;
//   @override
//   initState() {
//     setState(() {
//       setupUser();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(64, 64, 64, 1),
//
//       // appBar: AppBar(
//       //   backgroundColor: Colors.white,
//       //   title: RichText(
//       //     text: const TextSpan(
//       //         style: TextStyle(
//       //             fontSize: 25,
//       //             fontWeight: FontWeight.w700,
//       //             color: Colors.blue),
//       //         children: <TextSpan>[
//       //           TextSpan(text: 'FOO'),
//       //           TextSpan(text: 'TURE', style: TextStyle(color: Colors.green))
//       //         ]),
//       //   ),
//       //   titleSpacing: 0,
//       //   leading: IconButton(
//       //     icon: const Icon(
//       //       Icons.menu,
//       //       color: Colors.red,
//       //     ),
//       //     onPressed: () {
//       //       print("Biểu tượng danh sách đã được nhấn.");
//       //     },
//       //   ),
//       // ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(height: 60),
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(75),
//                   color: Colors.green,
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 10.0,
//                       color: Colors.black,
//                     ),
//                   ],
//                 ),
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage("assets/avatar.png"),
//                 ),
//               ),
//               SizedBox(height: 5),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.all(5),
//                     width: 300,
//                     decoration: BoxDecoration(),
//                     child: TextField(
//                       textAlign: TextAlign.center,
//                       controller: namecontroller,
//                       style: const TextStyle(
//                           fontSize: 18,
//                           color: Color.fromRGBO(255, 242, 204, 1)),
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hoverColor: Colors.yellow,
//                         hintText: "Ho ten",
//                         hintStyle: TextStyle(
//                             color: Color.fromRGBO(255, 242, 204, 0.6)),
//                       ),
//                     ),
//                   )
//
//                   // Container(
//                   //   padding: EdgeInsets.all(0.2),
//                   //   child: IconButton(
//                   //     style: const ButtonStyle(
//                   //       backgroundColor:
//                   //       MaterialStatePropertyAll<Color>(Colors.transparent),
//                   //     ),
//                   //     onPressed: () {},
//                   //     icon: Icon(Icons.edit),
//                   //     iconSize: 20,
//                   //     color: Colors.limeAccent,
//                   //     hoverColor: Colors.lightGreenAccent,
//                   //   ),
//                   // ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Stack(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AnimatedContainer(
//                         padding: EdgeInsets.only(left: 10),
//                         width: _with,
//                         decoration: BoxDecoration(
//                           color: Color(0XFFF1F8E9),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Stack(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(height: 5),
//                                       Container(
//                                         width: 270,
//                                         decoration: BoxDecoration(),
//                                         child: TextField(
//                                           textAlign: TextAlign.start,
//                                           controller: emailcontroller,
//                                           decoration: InputDecoration(
//                                             border: InputBorder.none,
//                                             hoverColor: Colors.yellow,
//                                             hintText: "email : example@abc.com",
//                                             hintStyle: TextStyle(
//                                                 color: Color.fromRGBO(
//                                                     0, 0, 0, 0.7)),
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 width: 3, //<-- SEE HERE
//                                                 color: Colors.greenAccent,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 10),
//                                       Container(
//                                         width: 500,
//                                         decoration: BoxDecoration(),
//                                         child: TextField(
//                                           textAlign: TextAlign.start,
//                                           controller: weighcontroller,
//                                           decoration: InputDecoration(
//                                             border: InputBorder.none,
//                                             hoverColor: Colors.yellow,
//                                             hintText: "your weigh : 50",
//                                             hintStyle: TextStyle(
//                                                 color: Color.fromRGBO(
//                                                     0, 0, 0, 0.7)),
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 width: 3, //<-- SEE HERE
//                                                 color: Colors.greenAccent,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 5),
//                                       Container(
//                                         width: 270,
//                                         decoration: BoxDecoration(),
//                                         child: TextField(
//                                           textAlign: TextAlign.start,
//                                           controller: heightcontroller,
//                                           decoration: InputDecoration(
//                                             border: InputBorder.none,
//                                             hoverColor: Colors.yellow,
//                                             hintText: "your heigh : 170",
//                                             hintStyle: TextStyle(
//                                                 color: Color.fromRGBO(
//                                                     0, 0, 0, 0.7)),
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 width: 3, //<-- SEE HERE
//                                                 color: Colors.greenAccent,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 5),
//                                       usercurrent.gender == 0
//                                           ? Text("male")
//                                           : Text("female"),
//                                       SizedBox(height: 5),
//                                       Container(
//                                         width: 270,
//                                         decoration: BoxDecoration(),
//                                         child: TextField(
//                                           textAlign: TextAlign.start,
//                                           controller: agecontroller,
//                                           decoration: InputDecoration(
//                                             border: InputBorder.none,
//                                             hoverColor: Colors.yellow,
//                                             hintText: "your age : 20",
//                                             hintStyle: TextStyle(
//                                                 color: Color.fromRGBO(
//                                                     0, 0, 0, 0.7)),
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 width: 3, //<-- SEE HERE
//                                                 color: Colors.greenAccent,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 5),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Positioned(
//                               right: 0,
//                               bottom: 0,
//                               child: IconButton(
//                                   icon: Icon(Icons.three_p_sharp),
//                                   onPressed: () {
//                                     Navigator.of(context).push(_createRoute());
//                                   }),
//                             ),
//                           ],
//                         ),
//                         duration: Duration(milliseconds: 800),
//                         curve: Curves.fastOutSlowIn,
//                       ),
//                       SizedBox(width: 5),
//                       // if(editting == 1)
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Container(
//                   padding: EdgeInsets.all(10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(10),
//                         child: ElevatedButton(
//                             onPressed: () {},
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                               child: Text("update"),
//                             )),
//                       )
//                     ],
//                   )),
//               Container(
//                   width: 335,
//                   padding: EdgeInsets.symmetric(horizontal: 15),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Color.fromRGBO(100, 165, 135, 1),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 10),
//                       Text(
//                         "BMI: ",
//                         style: TextStyle(
//                           color: Color.fromRGBO(226, 240, 217, 0.9),
//                           fontSize: 10,
//                           height: 0.8,
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Text(
//                         "50.0",
//                         style: TextStyle(
//                           height: 0.95,
//                           fontSize: 50,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromRGBO(226, 240, 217, 0.9),
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Text(
//                         "NORMAL",
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: Color.fromRGBO(226, 240, 217, 0.9),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Container(
//                           padding: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Color(0XFFF1F8E9),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               SizedBox(height: 10),
//                               Icon(
//                                 Icons.health_and_safety,
//                                 color: Color.fromRGBO(0, 0, 0, 0.6),
//                                 size: 20,
//                               ),
//                               Text("BMR : "),
//                               Text(
//                                 "1.358",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                               SizedBox(width: 10),
//                               Text("Calories"),
//                             ],
//                           )),
//                       SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 30, vertical: 5),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: Color(0XFFF1F8E9),
//                             ),
//                             child: Text(
//                               "400",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color.fromRGBO(0, 0, 0, 0.8),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 30, vertical: 5),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: Color(0XFFF1F8E9),
//                             ),
//                             child: Text(
//                               "400",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color.fromRGBO(0, 0, 0, 0.8),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 30, vertical: 5),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: Color(0XFFF1F8E9),
//                             ),
//                             child: Text(
//                               "400",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color.fromRGBO(0, 0, 0, 0.8),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 40),
//                     ],
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Route _createRoute() {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) =>
//           const ProflieScreen(),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(0.0, 1.0);
//         const end = Offset.zero;
//         const curve = Curves.ease;
//
//         var tween =
//             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//         return SlideTransition(
//           position: animation.drive(tween),
//           child: child,
//         );
//       },
//     );
//   }
//
//   void setupUser() {
//     usercurrent.gender = 0;
//     usercurrent.heigh = 170;
//     usercurrent.weigh = 50;
//     usercurrent.age = 20;
//   }
// }
