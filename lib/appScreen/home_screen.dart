import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mental_trainingscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images=["assets/images/cardimage.png","assets/images/cardimage2.png"];
  List<String> newImages=
  ["assets/images/cardimage3.png","assets/images/cardimage4.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child:buildWidget(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize:0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/Iconshome.png",),
              size:60,
              color:Color(0xFF4A80F0),

            ),
            label:""
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/Iconslessons.png",),
              size:60,
              color:Color(0xFF89909A),

            ),
            label:""
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/Iconsmeditation.png",),
              size:60,
              color:Color(0xFF89909A),
            ),
            label:""
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/profile.png",),
              size:60,
              color:Color(0xFF89909A),
            ),
            label:""
          ),

        ],
      ),
    );
  }

  buildWidget() {
    return Column(
      children: [
        buildHeaderImage(),
        SizedBox(height:10,),
        buildRow("Popular"),
        buildPopularList(),
        buildRow("New"),
        buildNewList(),
      ],
    );
  }

  buildHeaderImage() {
    return Image.asset("assets/images/headerImage.png");
  }

  buildRow(String value) {
    return Padding(
      padding:EdgeInsets.only(left:30,right:30),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
           Text(value,style:TextStyle(fontSize:20,color:Colors.black),),
           Text("See All",style:TextStyle(fontSize:15,color:Color(0xFF4A80F0)),)
      ],),
    );
  }

  buildPopularList() {

    return SizedBox(
      height:200,
      child: GestureDetector(
        onTap:()
        {
          Navigator.push(context,MaterialPageRoute(builder:(_)=>
              MentalTrainingScreen()));
        },
        child: ListView.builder(itemCount:images.length,
        shrinkWrap:true,
        primary:true,
        scrollDirection:Axis.horizontal,
        itemBuilder:(BuildContext c,int index)
        {
          return Image.asset(images[index]);
        }),
      ),
    );
  }

  buildNewList() {

    return SizedBox(
      height:200,
      child: GestureDetector(
        onTap:()
        {
          Navigator.push(context,MaterialPageRoute(builder:(_)=>
              MentalTrainingScreen()));
        },
        child: ListView.builder(itemCount:newImages.length,
            shrinkWrap:true,
            primary:true,
            scrollDirection:Axis.horizontal,
            itemBuilder:(BuildContext c,int index)
            {
              return Image.asset(newImages[index]);
            }),
      ),
    );
  }
}
