import 'package:flutter/material.dart';

class pagefood extends StatefulWidget {
  final  String url ;
  final String restname ;
  final String rate ;
  final String location ;
  final String foodname ;

  const pagefood({
    required this.url,
    required this.restname,
    required this.rate,
    required this.location,
    required this.foodname,
  });

  @override
  State<pagefood> createState() => _pagefoodState();
}

class _pagefoodState extends State<pagefood> {
  int num = 0 ;
  int price1 = 6500;
  int price2 = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
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
                top: 20,
                right: 20,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_forward,size: 35,),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.restname,style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.rate,style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    Icon(Icons.tag_faces),
                    SizedBox(width: 5,),
                    Text("سعر التوصيل 1.500 \n د.ع ",style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),),
                    Icon(Icons.shopping_cart_outlined),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("الحد الادنى للطلب \n 5000 د.ع ",style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,

                    ),),
                    Icon(Icons.monetization_on_outlined,),
                    SizedBox(width: 120,),
                    Text(widget.location,style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,

                    ),),
                    Icon(Icons.location_on_outlined),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("وقت التوصيل المتوقع من نصف ساعة ال \n ساعة",style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),),
                    Icon(Icons.access_time_outlined,),

                  ],
                ),
                Text(widget.foodname,style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.keyboard_arrow_up_sharp,size: 40,),
                        Column(
                          children: [
                            Text("اضافات",style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),),
                            Text("اختياري",style: TextStyle(fontSize: 20,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text("تعليمات خاصة",style: TextStyle(fontSize: 25,
                ),),
                Center(
                  child: Container(
                    height: 100,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("اذا كانت لديك اي ملاحظات خاصة بالطلب يرجى \n كتابتها هنا",
                          style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          num ++ ;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child:Icon(Icons.add),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      child: Center(
                        child: Text("$num",style: TextStyle(fontSize: 20),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if (num>0)
                            num -- ;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child:Center(
                          child: Text("-",style: TextStyle(fontSize: 40),),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Center(
                  child:Text("${price2 = price1 * num } د.ع ",style: TextStyle(fontSize: 25,color: Colors.red),) ,
                ),
                SizedBox(height: 5,),
                Center(
                  child:Container(
                    height: 70,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red,
                    ),
                    child: Center(
                      child:Text("اضافة الى السلة",style: TextStyle(fontSize: 25,color: Colors.white),) ,
                    ),
                  ) ,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
