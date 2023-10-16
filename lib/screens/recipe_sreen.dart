import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodapp/models/Viewmodel/FoodViewmodel.dart';
import 'package:foodapp/models/user.dart';
import 'package:http/http.dart' as http;

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key, required this.foodViewmodel});
  final FoodViewmodel foodViewmodel;
  @override
  State<RecipeScreen> createState() => _RecipeScreen();
}

class _RecipeScreen extends State<RecipeScreen> {
  double devicehei = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.foodViewmodel.imageUrl),
                    alignment: Alignment.topCenter)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      )),
                    )
                  ],
                ),
                Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 100,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 40,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(
                                  color: Colors.black87,
                                ))),
                            child: Column(
                              children: [
                                SizedBox(height: 40),
                                // SingleChildScrollView(
                                //   scrollDirection: Axis.vertical,
                                //   child: Column(
                                //     children: [
                                //
                                //       Text("asd")
                                //     ],
                                //   ),
                                // )
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height - 200,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          bottom: BorderSide(
                                        color: Colors.black87,
                                      ))),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 3,
                                                  color: Color.fromRGBO(
                                                      64, 64, 64, 0.8)),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.receipt),
                                                  SizedBox(width: 10),
                                                  Text("Ingredients"),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                  height: 10,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                    bottom: BorderSide(
                                                        width: 3,
                                                        color: Color.fromRGBO(
                                                            64, 64, 64, 0.8)),
                                                  ))),
                                              SizedBox(height: 30),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ...SplitString(widget
                                                            .foodViewmodel
                                                            .RecipeInstruction)
                                                        .map((item) =>
                                                            ListText(item)),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromRGBO(89, 89, 89, 1),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.food_bank_outlined,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      "Recipe",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                width:  MediaQuery.of(context).size.width,

                                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ...SplitString(widget
                                                            .foodViewmodel
                                                            .RecipeIngredientParts)
                                                        .map((item) =>
                                                            ListTextRecipe(
                                                                item.trim())),


                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 10),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 5,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                Color.fromRGBO(64, 64, 64, 1),
                                          ),
                                          child: Text(
                                            "Special Ingre",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        alignment: Alignment
                                                            .centerRight,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              191, 191, 191, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            80,
                                                        child: Text(
                                                          "Serotoin",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        alignment: Alignment
                                                            .centerRight,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              217, 217, 217, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            170,
                                                        child: Text(
                                                          "300 gr",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        alignment: Alignment
                                                            .centerRight,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    242,
                                                                    242,
                                                                    242,
                                                                    1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black,
                                                                blurRadius: 10,
                                                              )
                                                            ]),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            270,
                                                        child: Text(
                                                          "Uc ga",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    128,
                                                                    128,
                                                                    128,
                                                                    1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        alignment: Alignment
                                                            .centerRight,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              191, 191, 191, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            80,
                                                        child: Text(
                                                          "Serotoin",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        alignment: Alignment
                                                            .centerRight,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              217, 217, 217, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            170,
                                                        child: Text(
                                                          "300 gr",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        alignment: Alignment
                                                            .centerRight,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    242,
                                                                    242,
                                                                    242,
                                                                    1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black,
                                                                blurRadius: 10,
                                                              )
                                                            ]),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            270,
                                                        child: Text(
                                                          "Uc ga",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    128,
                                                                    128,
                                                                    128,
                                                                    1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        alignment: Alignment
                                                            .centerRight,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              191, 191, 191, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            80,
                                                        child: Text(
                                                          "Serotoin",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        alignment: Alignment
                                                            .centerRight,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              217, 217, 217, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            170,
                                                        child: Text(
                                                          "300 gr",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        alignment: Alignment
                                                            .centerRight,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    242,
                                                                    242,
                                                                    242,
                                                                    1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black,
                                                                blurRadius: 10,
                                                              )
                                                            ]),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            270,
                                                        child: Text(
                                                          "Uc ga",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    128,
                                                                    128,
                                                                    128,
                                                                    1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 20,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(64, 64, 64, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Text(
                                widget.foodViewmodel.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  Widget ListTextRecipe(String string) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        string,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }

  Widget ListText(String string) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        string,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(64, 64, 64, 0.8)),
      ),
    );
  }

  List<String> SplitString(String stringSplit) {
    String cleanString = stringSplit.replaceAll("[", "").replaceAll("]", "");
    List<String> resultString = cleanString.split(", ");
    return resultString;
  }
}
