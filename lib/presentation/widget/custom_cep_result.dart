import 'package:flutter/material.dart';

class CustomCepResultWidget extends StatefulWidget {
  const CustomCepResultWidget({super.key});

  @override
  State<CustomCepResultWidget> createState() => _CustomCepResultWidgetState();
}

class _CustomCepResultWidgetState extends State<CustomCepResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text('Endereço:'));
  }
}