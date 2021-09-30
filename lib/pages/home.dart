import 'package:flutter/material.dart';
import 'package:splash_login/animation/slideFadeAnimation.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> categories = ['Burger','Pizza','Desert','Salad','Juice'];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // appBar: AppBar(
      //   leading: Icon(null),
      //   backgroundColor: Colors.grey[100],
      //   elevation: 0,
      //   brightness: Brightness.light,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.shopping_cart_rounded,color: Colors.grey[800],size: 35,),
      //     ),
          
      //   ],
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SlideFadeAnimation(
            delay: 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
              padding: const EdgeInsets.only(left: 15,top: 15),
              child: Container(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 19,color: Colors.grey[700]),
                    suffixIcon: Icon(Icons.search_rounded,color: Colors.grey[700],size: 35,),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey[500],width: 2.2)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey[500],width: 2.2)
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,right: 10),
              child: Icon(Icons.shopping_cart_rounded,color: Colors.grey[700],size: 37,),
            )
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SlideFadeAnimation(
              delay: 1.3,
              child: Text("Dax Shop",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold),)),
          ),
          SizedBox(height: 20,),
          _buildNavBar(),
          SizedBox(height: 30,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                SlideFadeAnimation(delay: 2.4, child: makeItem(image: 'assets/images/img4.png',name: 'Burger',price: '6')),
                SlideFadeAnimation(delay: 2.4, child: makeItem(image: 'assets/images/one.jpg',name: 'Pizza',price: '9')),
                SlideFadeAnimation(delay: 2.4, child: makeItem(image: 'assets/images/Desert.png',name: 'Desert',price: '4')),
                SlideFadeAnimation(delay: 2.4, child: makeItem(image: 'assets/images/salad.jpg',name: 'Salad',price: '4')),
                SlideFadeAnimation(delay: 2.4, child: makeItem(image: 'assets/images/juice.png',name: 'Juice',price: '3')),
              ],),
            ),
          ),
          SizedBox(height: 80,)
        ],),
      ),
    );
  }
  Widget _buildNavBar(){
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context , index) => _buildNavBarList(categories[index] , index)
      ),
    );
  }
  Widget _buildNavBarList(name,index){
    return Stack(
      children: [
        SlideFadeAnimation(
          delay: 1.4,
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: GestureDetector(
            onTap: (){
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: currentIndex == index ? Colors.orange[500] : Colors.grey[200],
                borderRadius: BorderRadius.circular(30)
              ),
              child: Text(name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: currentIndex == index ? FontWeight.bold : null,
                color: currentIndex == index ? Colors.white : Colors.black
              ),),
            ),
          ),
              ),
        ),
      ],
    );
  }
  Widget makeItem({image,name,price}){
    return AspectRatio(
      aspectRatio: 1/1.3,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
          )
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Align(
                      alignment: Alignment.topRight,
                      child:  Icon(Icons.favorite,color: Colors.pink,size: 35,),
                    ) ,
                    SizedBox(height: 250,),
                    Text("\$$price",
                      style: TextStyle(fontSize: 38,color: Colors.white,fontWeight: FontWeight.bold)
                    ),
                    Text(name,
                      style: TextStyle(fontSize: 28,color: Colors.white)
                    ),
                  ],)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}