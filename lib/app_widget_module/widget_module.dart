
import 'package:flutter/material.dart';

class AppWidget{

 static Widget containerWidget(){
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset("assets/app_icon/icon.jpg",fit: BoxFit.fill,),
      ),
    );
  }
}