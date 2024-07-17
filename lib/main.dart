import 'package:cep_finder/presentation/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CepFinder());
}

class CepFinder extends StatelessWidget {
  const CepFinder({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEP Finder',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
