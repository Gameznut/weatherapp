import 'package:flutter/material.dart';
import 'package:weatherapp/screens/choose_location.dart';
import "package:weatherapp/screens/home.dart";
import 'package:weatherapp/screens/loading.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/location': (context) => const ChooseLocation()
  },
));

