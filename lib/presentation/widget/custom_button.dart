import 'package:cep_finder/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final void Function() onButtonPressed;
  final Color backgroundColor;
  final Color textColor;
  final double textFontSize;
  final double borderRadius;
  final double width;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onButtonPressed,
    this.backgroundColor = CustomColors.backgroundColor,
    this.textColor = Colors.white,
    this.textFontSize = 20,
    this.borderRadius = 10,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
        onPressed: onButtonPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: textFontSize,
            ),
          ),
        ));
  }
}
