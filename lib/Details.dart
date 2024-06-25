import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ItemDetails extends StatefulWidget {
  final Map<String, dynamic> data;  // Specifying the type

  const ItemDetails({super.key, required this.data});  // Proper constructor

  @override
  State<ItemDetails> createState() => _Item();
}

class _Item extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
        bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
        
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "*"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: "*"),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "*"),

      ],),


      endDrawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          children: [
            Icon(Icons.store),
            Text(
              " E-Commerce-App  ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Raed ",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          widget.data['image'] != null 
              ? Image.asset(widget.data['image']) 
              : Container(), // Handling null image case
          Container(
          child: Column(
            children: [
              Container(height: 15,),
              Text(widget.data['title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),), 
              Container(height: 15,),
              Text(widget.data['subtitle'],textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 17)) ,
              Container(height: 15,),
              Text(widget.data['price'],textAlign: TextAlign.center,style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 17))
            ]
           ,),),
           SizedBox(height: 10,),
              
           Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text("Color : ",style: TextStyle(fontSize: 19)),
              SizedBox(width: 10,),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.yellow)
                ),
              ),
              SizedBox(width: 10,),
              Text("Grey",style: TextStyle(fontSize: 19)),
              SizedBox(width: 10,),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              SizedBox(width: 10,),
              Text("Black",style: TextStyle(fontSize: 19)),

           ],),
           SizedBox(height: 15,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Text("Size : 34 35 40 41 ",style: TextStyle(color: Colors.grey,fontSize: 17),),
           ],
           ),
           Container(
            margin:EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            height: 70,
            width: 20,
            child: MaterialButton(
              padding: EdgeInsets.all(20),
              color: Colors.black,
              onPressed: (){},
              child: Text("Add To Cart",style: TextStyle(color: Colors.white,fontSize: 18),),
              
            ),
           )
        ],
      ),
    );
  }
}
