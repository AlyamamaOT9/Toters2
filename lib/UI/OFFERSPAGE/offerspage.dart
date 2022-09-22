import 'package:flutter/material.dart';

import '../DATAFILE/data.dart';
import '../RESTAURANTPAGE/restpage.dart';

class offers extends StatefulWidget {
  const offers({Key? key}) : super(key: key);

  @override
  State<offers> createState() => _offersState();
}

class _offersState extends State<offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_forward,color: Colors.black,size: 30,),
          ),
          ),

        ],
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
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
                          image: DecorationImage(image: NetworkImage(restpost[index]["url"]),
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
                    Text(restpost[index]["name"],style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("\$ جميع الاوقات",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
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
    );
  }
}
