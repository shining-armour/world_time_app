import 'package:flutter/material.dart';
import 'package:worldtimer/pages/home.dart';
import 'package:worldtimer/pages/choose_location.dart';
import 'package:worldtimer/pages/loading_page.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',      //overrides the default '/' home route
    routes: {
      '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }
  ));

