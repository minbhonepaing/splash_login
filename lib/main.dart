import 'package:flutter/material.dart';
import 'package:splash_login/pages/splash.dart';

void main(){
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      theme: ThemeData(
        fontFamily: 'Roboto'
      ),
    )
  );
}