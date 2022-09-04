import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Alyamama Ahmed",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 25,
              ),),
              SizedBox(height: 10,),
              Container(
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: Colors.white,
                ),
                child: Row(
                  children: [
                    post1(
                      (Icons.person),
                      "profile",
                    ),
                    post1(
                      (Icons.headset_mic),
                      "support",
                    ),
                    post1(
                      (Icons.credit_card),
                      "payment",
                    ),
                    post1(
                      (Icons.language),
                      "language",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(20),
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Toters Cash",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 20,
                        ),),
                        SizedBox(width: 5,),
                        Icon(Icons.info_outline,color: Colors.green,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    post2(
                      (Icons.wallet),
                      "Wallet",
                      "IQD 0",
                    ),
                    divider(),
                    post2(
                      (Icons.add),
                      "Add Funds",
                      "",
                    ),
                    divider(),
                    post2(
                      (Icons.arrow_forward),
                      "Send Funds",
                      "",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(20),
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Promotions",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20,
                    ),),
                    SizedBox(height: 20,),
                    post2(
                      (Icons.percent),
                      "Credits",
                      "IQD 0",
                    ),
                    divider(),
                    post2(
                      (Icons.label_outline),
                      "Add Promo Code",
                      "",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(20),
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account Details",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20,
                    ),),
                    SizedBox(height: 20,),
                    post3(
                      (Icons.notifications_none),
                      "Notification",
                    ),
                    divider(),
                    post3(
                      (Icons.location_on_outlined),
                      "Address",
                    ),
                    divider(),
                    post3(
                      (Icons.favorite_border),
                      "Favorite",
                    ),
                    divider(),
                    post3(
                      (Icons.tune_outlined),
                      "Preferences",
                    ),
                    divider(),
                    post3(
                      (Icons.personal_injury_outlined),
                      "Add Promo Code",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(20),
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Help Center",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20,
                    ),),
                    SizedBox(height: 20,),
                    post3(
                      (Icons.headset_mic_rounded),
                      "Get Support",
                    ),
                    divider(),
                    post3(
                      (Icons.chat_outlined),
                      "Support Tickets",
                    ),
                    divider(),
                    post3(
                      (Icons.route_outlined),
                      "Legal",
                    ),
                    divider(),
                    post3(
                      (Icons.question_mark),
                      "FAQ",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(20),
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    post4(
                      (Icons.output),
                      "Sign Out",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

      ],
    );
  }
  Container post1( IconData icon,String text){
    return Container(
      height: 100,
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(0.1),
            ),
            child: Icon(icon,color: Colors.grey,),
          ),
          Text(text,style: TextStyle(
            fontSize: 20,
          ),),
        ],
      ),
    );
  }
  Row post2(IconData icon2 , String text2 ,String x){
    return Row(
      children: [
        Icon(icon2,color: Colors.grey,),
        SizedBox(width: 10,),
        Text(text2,style: TextStyle(
          fontSize: 20,
        ),),
        Spacer(),
        Text(x,style: TextStyle(
            color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold
        ),),
      ],
    );
  }
  Container divider(){
    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 5),
      height: 30,
      width: 360,
      child: Divider(height: 1,thickness: 2,color: Colors.grey.withOpacity(0.1),),
    );
  }
  Row post3(IconData icon2 , String text2){
    return Row(
      children: [
        Icon(icon2,color: Colors.grey,),
        SizedBox(width: 10,),
        Text(text2,style: TextStyle(
          fontSize: 20,
        ),),
      ],
    );
  }
  Row post4(IconData icon2 , String text2){
    return Row(
      children: [
        Icon(icon2,color: Colors.red,),
        SizedBox(width: 10,),
        Text(text2,style: TextStyle(
          fontSize: 20,color: Colors.red,
        ),),
      ],
    );
  }

}
