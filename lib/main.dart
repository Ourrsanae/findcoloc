
import 'package:findcoloc/themes/theme.dart';
import 'package:findcoloc/view/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(//racine widget< <<
      debugShowCheckedModeBanner: false,// contrôle l'affichage de la bannière de débogage
      title : 'House Mate Hub',
      theme : lightMode,
      darkTheme: darkMode,
      home: WelcomeScreen(),

    );
  }

}