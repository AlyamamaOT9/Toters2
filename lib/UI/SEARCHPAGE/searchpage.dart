import 'package:flutter/material.dart';
import '../DATAFILE/data.dart';


class searchpage extends StatefulWidget {
  const searchpage({Key? key}) : super(key: key);

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Icon(Icons.search,size: 35,),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("search for stor or item",style: TextStyle(
                  fontSize: 20,
                ),),
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          color: Colors.teal,
          child: Row(
            children: [
              Image.network("https://cdn0.iconfinder.com/data/icons/work-from-home-18/512/FoodDelivery-food-delivery-meal-order-256.png",
                width: 100,
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("order any thing",style: TextStyle(
                    fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold,
                  ),),
                  Text("since the 1500s, when an  \n a galley of type and ",style: TextStyle(
                    fontSize: 15, color: Colors.white,
                  ),),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 35,)
            ],
          ),
        ),
        Container(
          height: 450,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: search.length,
            itemBuilder: (BuildContext context , int index){
              return Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Image.network(search[index]["url"],
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(search[index]["name"],style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold,
                        ),),
                        Text("since the 1500s, when an  \n a galley of type and ",style: TextStyle(
                          fontSize: 15, color: Colors.grey,
                        ),),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
