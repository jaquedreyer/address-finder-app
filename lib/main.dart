import 'package:cep_finder/presentation/pages/home_page.dart';
import 'package:cep_finder/utils/constants/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AddressFinder());
}

class AddressFinder extends StatelessWidget {
  const AddressFinder({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address Finder',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.backgroundColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
