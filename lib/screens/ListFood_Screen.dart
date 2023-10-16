import 'package:flutter/material.dart';
class ListFood_Screen extends StatefulWidget {
  const ListFood_Screen({Key? key}) : super(key: key);

  @override
  State<ListFood_Screen> createState() => _ListFood_ScreenState();
}

class _ListFood_ScreenState extends State<ListFood_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(64, 64, 64, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:     Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [

                      Container(
                        width: 80,
                        height: 80,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 12.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        child:CircleAvatar(
                          backgroundImage: AssetImage('assets/images/avatar.png'),

                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello user",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 19,


                              ),
                            ),
                            Text("What do you need for today",
                              style: TextStyle(

                                color: Colors.white,
                                fontSize: 13,


                              ),),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width*0.8,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(100, 165, 135, 1),
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Icon(
                            Icons.search,
                            size: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.67,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(

                            children: [
                              SizedBox(width: 10),
                              Container(
                                height: MediaQuery.of(context).size.height *0.9,
                                width: MediaQuery.of(context).size.width*0.6,
                                child: TextField(
                                  textAlign:  TextAlign.left,
                                  decoration: InputDecoration(

                                      hintText:  "Search from here"
                                  ),
                                ),
                              )

                            ],
                          ),

                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.95,
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  decoration: BoxDecoration(
                  ),
                  child: Row(
                    children: [
                      Container(

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            children: [
                              Text('food'),
                              SizedBox(width: 5),
                              Icon(Icons.food_bank)
                            ],
                          )
                      ),
                      SizedBox(width: 10),
                      Container(

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            children: [
                              Text('drink'),
                              SizedBox(width: 5),
                              Icon(Icons.emoji_food_beverage)
                            ],
                          )
                      ),
                      SizedBox(width: 10),
                      Container(

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            children: [
                              Text('popular'),
                              SizedBox(width: 5),
                              Icon(Icons.group)
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                    width: MediaQuery.of(context).size.width*0.95,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'VietNam food',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,

                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                cardfood(),
                                cardfood(),
                                cardfood(),
                              ],
                            ),
                          ],
                        )

                    )

                )
              ],
            ),
          ),
        )


      ),
    );
  }
  Widget cardfood(){
    return Container(
      height: 200,
      width: 160,
      child: Stack(
        children: [
          Positioned(
              top: 30,
              left: 0,
              child: Container(
                height: 150,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [

                    SizedBox(height: 55),
                    Text(
                        "Mi quang",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Text('30 calories'),
                    Text('20 fat')
                  ],
                ),
              )
          ),
          Positioned(
            top: 0,
            left: 30,

            child: Container(
              height: 80,
              width: 80,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                  color: Colors.white,
                  blurRadius: 15.0
                )

                ]
              ),
              child:  CircleAvatar(
                backgroundImage: AssetImage('assets/images/Foodtest.jpg'),
              ),
            )

          ),
          Positioned(
            bottom: 30,
            left: 105,
            child: Container(
              child: Icon(Icons.five_k_plus),
            ),
          ),

        ],
      ),
    );
  }
}

