import 'Details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Details.dart';

void main() {
  runApp(const Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List categorie=[
     
     {"iconame":Icons.laptop,"title":"Laptop"},
     {"iconame":Icons.mobile_friendly,"title":"Mobile"},
     {"iconame":Icons.bike_scooter,"title":"Bike"},
     {"iconame":Icons.wallet_giftcard,"title":"Gifts"},
     {"iconame":Icons.mouse,"title":"Mouse"},

  ];

  List items=[
     
     {"image":"images/latop.png","title":"Laptop HP","subtitle":"Description Fine Good","price":"350\$"},
     {"image":"images/phone.png","title":"Ihpone 14","subtitle":"Description Fine Good","price":"900\$"},
     {"image":"images/shoes.png","title":"Zara","subtitle":"Description Fine Good","price":"300\$"},
     {"image":"images/latop.png","title":"Lenovo","subtitle":"Description Fine Good","price":"1000\$"},
     {"image":"images/latop.png","title":"Laptop HP","subtitle":"Description Fine Good","price":"350\$"},
     {"image":"images/phone.png","title":"Ihpone 14","subtitle":"Description Fine Good","price":"900\$"},
     {"image":"images/shoes.png","title":"Zara","subtitle":"Description Fine Good","price":"300\$"},
     {"image":"images/latop.png","title":"Lenovo","subtitle":"Description Fine Good","price":"1000\$"},
     
  ];
 
 
  @override
  Widget build(BuildContext context) {
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

      body: Container(
          
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: ListView(children: [
          Row(
            children: [
            Padding(padding: EdgeInsets.only(top:80)),
            Expanded(child:TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.grey[300],
              filled: true,
              hintText: "Search",
              prefixIcon: Icon(Icons.search)
            ),)),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Icon(Icons.menu,size: 40,),
            ),
           ]),
          Container(height: 4,),
          
          Text("Categories",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          
          Container(height: 4,),
          Container(
            height: 120,
            width: 100,
            child: ListView.builder(
                  scrollDirection: Axis.horizontal,
            itemCount:categorie.length ,
            itemBuilder: (context,i){
              return Container(
                  child: Column(
                    children: [
                    Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: Colors.grey[200],
                    ),
                 
                    child: Icon(categorie[i]["iconame"],size: 40,),
                    padding: EdgeInsets.all(20),
                  ),
                  Text(categorie[i]["title"],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)

                  ],),
              );
            }
            
          ),
          ),

          Text("Best Selling",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          Container(height: 20,),
           GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 200),
            itemCount: items.length,
            itemBuilder: (context,i){
              return InkWell(  
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemDetails(data:items[i])));
                },
              child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              color: Colors.grey,
                              child: Image.asset(items[i]["image"],height: 100,fit: BoxFit.fill,),
                            ),
                            Container(height: 10,),
                            Text(items[i]["title"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Text(items[i]["subtitle"],style: TextStyle(color: Colors.grey,fontSize: 15),),
                            Container(height: 4,),
                            Text(items[i]["price"],style: TextStyle(color: Colors.orange,fontSize: 15),),
                            
                          ],
                        ),
                      ),
              );
                   
            }
                    
           )



          ]
        ),
      

      ),
    );
  }
}
