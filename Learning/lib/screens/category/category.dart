
import 'package:flutter/material.dart';
import 'package:learning/constant.dart';

class CategoryScreen extends StatefulWidget {
  static String routeName='/categoryscreen';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(size.height*0.1) ,
        child: AppBar(
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: size.width*0.05,),onPressed: (){}),
          backgroundColor: Colors.transparent,
        title: Text('Categories',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w200),),
        flexibleSpace:Container(
           padding: EdgeInsets.symmetric(vertical: size.height*0.3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
           color: kTextColor
          ),
        ) ,
        elevation: 0,),
      ),
    );
  }
}
