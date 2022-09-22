import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../DATAFILE/data.dart';
import '../MAELPAGE/mealpage.dart';


var Mname = [""];
var Mdesc = [""];
var img = [""];


class burgerpage extends StatefulWidget {
  final String url ;
  final String restname ;
  final String descrept ;
  final String rate ;
  final String comment ;

  const burgerpage({
    required this.url,
    required this.restname,
    required this.descrept,
    required this.rate,
    required this.comment,

  });

  @override
  State<burgerpage> createState() => _burgerpageState();
}

class _burgerpageState extends State<burgerpage> {
  Future GetData() async {
    var url = Uri.parse('http://localhost:4000/meal');
    Map<String, String> headers = {"Content-type": "application/json"};
    Response response = await get(url);
    int statusCode = response.statusCode;
    String body = response.body;
    List<dynamic> list2 = jsonDecode(body);
    setState(() {
      for(int i = 0 ; i < list2.length;i++){
        Mname.add(list2[i]['M_name']);
        img.add(list2[i]['M_img']);
        Mdesc.add(list2[i]['description']);

      }
    });
    // TODO convert json to object...
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(widget.url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: -20,
                    child:Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("36-46",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text("mins",style: TextStyle(fontSize: 15,color: Colors.grey.withOpacity(0.7),),),

                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child:GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back_ios,size: 40,color: Colors.teal,),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.restname,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(widget.descrept,
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.monetization_on_outlined,color: Colors.red,),
                              Text("10% cashback",style: TextStyle(fontSize: 15,color: Colors.red,
                                  fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.withOpacity(0.2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.add_circle_outline,color: Colors.blue,),
                              Text("Earn Points",style: TextStyle(fontSize: 15,color: Colors.blue,
                                  fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(widget.rate,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.teal,size: 30,),
                                Icon(Icons.star,color: Colors.teal,size: 30,),
                                Icon(Icons.star,color: Colors.teal,size: 30,),
                                Icon(Icons.star,color: Colors.teal,size: 30,),
                                Icon(Icons.star,color: Colors.grey.withOpacity(0.3),size: 30,),
                              ],
                            ),
                            Text("Based on 1200 rating",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),),
                          ],
                        ),
                        SizedBox(width: 90,),
                        Icon(Icons.arrow_forward_ios_rounded,size: 30,color: Colors.teal,)
                      ],
                    ),
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width-40,
                      // color: Colors.red,
                      child: Divider(
                        color: Colors.grey.withOpacity(0.4),
                        thickness: 1,
                      ),
                    ),
                    Row(
                      children: [
                        Text("Ali",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        SizedBox(width: 10,),
                        Icon(Icons.star,color: Colors.teal,size: 20,),
                        Icon(Icons.star,color: Colors.teal,size: 20,),
                        Icon(Icons.star,color: Colors.teal,size: 20,),
                        Icon(Icons.star,color: Colors.teal,size: 20,),
                        Icon(Icons.star,color: Colors.teal,size: 20,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.comment,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey),),
                      ],
                    ),
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width-40,
                      // color: Colors.red,
                      child: Divider(
                        color: Colors.grey.withOpacity(0.4),
                        thickness: 1,
                      ),
                    ),
                    Container(
                      height: 450,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: Mname.length,
                        itemBuilder: (BuildContext context , int index){
                          return Container(
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(Mname[index],style: TextStyle(
                                      fontSize: 20,fontWeight: FontWeight.bold,
                                    ),),
                                    Text(Mdesc[index],style: TextStyle(
                                      fontSize: 20, color: Colors.black,
                                    ),),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> pagefood(url : mealpost[index]["url"],
                                        restname : mealpost[index]["restname"], rate : mealpost[index]["rate"], location : mealpost[index]["location"], foodname : mealpost[index]["mealname"],
                                    ),));
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      image: DecorationImage(image: NetworkImage(img[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
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
            ],
          ),
        ],
      ),
    );
  }
}
