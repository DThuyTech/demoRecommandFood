import 'package:flutter/material.dart';
import 'package:foodapp/models/Viewmodel/FoodViewmodel.dart';
import 'package:foodapp/models/user.dart';
import 'package:foodapp/screens/recipe_sreen.dart';

class Fooddetail extends StatefulWidget {
  const Fooddetail({super.key, required this.foodViewmodel});
  final FoodViewmodel foodViewmodel;
  @override
  State<Fooddetail> createState() => _ProflieScreenState();
}

class _ProflieScreenState extends State<Fooddetail> {
  double _with = 330;
  int editting = 0;
  double _withediting = 0;
  User usercurrent = User(
      idUser: 0,
      email: 'email',
      password: 'password',
      weigh: 0,
      heigh: 0,
      gender: true,
      idRole: 2,
      age: 21,
      avatar: 'avatar',
      name: 'name');
  @override
  initState() {
    setState(() {
      /*try{
        usercurrent =  fetchUser() as User;
      } catch (e) {
          throw Exception('Failed to fetch user');
        }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///ICON BACK
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 247, 245, 245),
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(50),
          child: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(64, 64, 64, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  widget.foodViewmodel.name,
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 246, 246, 246),
                  ),
                ),
              ],
            ),

            ///IMAGES FOOD
            SizedBox(height: 5),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.green,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.foodViewmodel.imageUrl),
              ),
            ),

            ////CONTAINER DETAIL FOOD
            SizedBox(
              height: 20,
              width: 50,
            ),
            Container(
              width: 500,
              height: 750,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(66, 46, 45, 45)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(65),
                            topRight: Radius.circular(65)),
                        color: Color.fromRGBO(100, 165, 135, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 130,
                    right: 130,
                    child: Container(
                      width: 1,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(240, 243, 242, 1),
                      ),
                    ),
                  ),

                  //TASKKBAR
                  SizedBox(
                    height: 50,
                    width: 50,
                  ),
                  Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 8),
                            Text(
                              widget.foodViewmodel.calories.toString(),
                              style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "calories",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: 80,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(231, 204, 202, 202),
                            )),
                        Column(
                          children: [
                            SizedBox(height: 8),
                            Text(
                              widget.foodViewmodel.protein.toString(),
                              style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "protein",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: 80,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(231, 204, 202, 202),
                            )),
                        Column(
                          children: [
                            SizedBox(height: 8),
                            Text(
                              widget.foodViewmodel.fat.toString(),
                              style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "fat",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //DESCRIPTION
                  Positioned(
                    top: 5,
                    left: 20,
                    child: Column(
                      children: [
                        SizedBox(height: 150),
                        Text(
                          'Description',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 20,
                    left: 20,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 190),
                            ...SplitString(widget.foodViewmodel.RecipeIngredientParts).map((item) => ListTextrecipe(item)),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 30,
                    left: 0,
                    bottom: 10,
                    child: Column(
                      children: [
                        SizedBox(height: 300),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '121',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 23,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 370,
                    left: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RecipeScreen(foodViewmodel: widget.foodViewmodel),
                        ));
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "recipe",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(100, 165, 135, 1),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),

    );


  }

  List<String> SplitString ( String stringSplit){
    String cleanString = stringSplit.replaceAll("[", "").replaceAll("]", "");
    List<String> resultString = cleanString.split(", ");
    return resultString;
  }
  Widget ListTextrecipe(String text){
    return  Text(
      text,
      textAlign: TextAlign.left,

      overflow: TextOverflow.clip,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }

}
