import 'dart:convert';
import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../DATAFILE/data.dart';
import '../OFFERSPAGE/offerspage.dart';
import '../RESTAURANTPAGE/restpage.dart';


var img = [""];
var Rname = [""];
var Rdesc = [""];
var img2 = [""];


class toters extends StatefulWidget {
  @override
  State<toters> createState() => _totersState();
}

class _totersState extends State<toters> {

  Future GetData() async {
    var url = Uri.parse('http://localhost:4000/offers');
    Map<String, String> headers = {"Content-type": "application/json"};
    Response response = await get(url);
    int statusCode = response.statusCode;
    String body = response.body;
    List<dynamic> list2 = jsonDecode(body);
    setState(() {
      for(int i = 0 ; i < list2.length;i++){
        img.add(list2[i]['O_img']);


      }
    });
    // TODO convert json to object...
  }
  Future GetData2() async {
    var url = Uri.parse('http://localhost:4000/restaurant');
    Map<String, String> headers = {"Content-type": "application/json"};
    Response response = await get(url);
    int statusCode = response.statusCode;
    String body = response.body;
    List<dynamic> list2 = jsonDecode(body);
    setState(() {
      for(int i = 0 ; i < list2.length;i++){
        Rname.add(list2[i]['R_name']);
        img2.add(list2[i]['R_img']);
        Rdesc.add(list2[i]['description']);

      }
    });
    // TODO convert json to object...
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetData();
    //GetData2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings_input_component_outlined,color: Colors.black,),
        actions: [
          Text("توصيل الى \n بغداد العراق",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:Padding(
        padding: EdgeInsets.all(5),
        child: Expanded(
          child: ListView(
            children: [
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("سجل الدخول باستخدام تطبيق توترز و استمتع بمزايا حصريا",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Icon(Icons.arrow_back,color: Colors.green,),
                ],
              ),
              SizedBox(height: 5,),
              Container(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: img.length,
                  itemBuilder: (context ,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context)=> offers()),);
                      },
                      child: Container(
                        height: 300,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(image: NetworkImage(img[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                //margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                height: 300,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    post(
                      "https://cdn1.iconfinder.com/data/icons/cuisine-food/128/food-restaurant-meal-fast_food-hamburger-burger-cheeseburger-256.png",
                      "البقالة",
                    ),
                    post(
                      "https://cdn3.iconfinder.com/data/icons/foods-62/48/burger-256.png",
                      "المطاعم",
                    ),
                    post(
                      "https://cdn4.iconfinder.com/data/icons/essentials-74/24/010_-_Bag-256.png",
                      "متاجر",
                    ),
                    post(
                      "https://cdn1.iconfinder.com/data/icons/lottery-5/64/cash_coins_currency_dollar_finance-256.png",
                      "الرصيد",
                    ),
                    post(
                      "https://cdn4.iconfinder.com/data/icons/delivery-121/62/address-delivery-map-tracking-distribution-256.png",
                      "المندوب",
                    ),
                    post(
                      "https://cdn4.iconfinder.com/data/icons/delivery-121/62/address-delivery-map-tracking-distribution-256.png",
                      "المندوب",
                    ),
                  ],
                ),
              ),

              Container(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: restpost.length,
                  itemBuilder: (BuildContext context , int index){
                    return Container(
                      padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.greenAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> burgerpage( url: restpost[index]["url"],restname: restpost[index]["name"] ,
                                    descrept:restpost[index]["desc"],
                                    rate: restpost[index]["rate"], comment: restpost[index]["comment"],
                                  ),));
                                },
                                child:Container(
                                  height: 150,
                                  width: 360,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red,
                                    image: DecorationImage(image: NetworkImage(img2[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 40,
                                child:
                                Icon(Icons.favorite_border,color: Colors.white,size: 35,),
                              ),
                              Positioned(
                                bottom: -10,
                                left: 40,
                                child:
                                Container(
                                  height: 40,
                                  width: 40,
                                  color: Colors.grey.withOpacity(0.4),
                                  child:Center(
                                    child: Text("1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(Rname[index],style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(Rdesc[index],style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: 15,),
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue.withOpacity(0.3),
                                ),

                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("اكسب نقاط",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
                                    Icon(Icons.add_circle_outline,color: Colors.blue,),
                                  ],
                                ),
                              ),
                              SizedBox(width: 15,),
                              Container(
                                height: 40,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.3),
                                ),

                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(restpost[index]["rate"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    Icon(Icons.star,color: Colors.blue,),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Container post(String url ,String text){
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 4,
           // offset: Offset(7, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(text ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
