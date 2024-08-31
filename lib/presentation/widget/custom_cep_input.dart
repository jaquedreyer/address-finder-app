import 'package:cep_finder/utils/cep_input_formatter.dart';
import 'package:cep_finder/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomCepInputWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController cepController;

  const CustomCepInputWidget(
      {super.key, required this.onChanged, required this.cepController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return StringsConstants.cepValido;
        } else if (value.length != 8) {
          return StringsConstants.cep8digitos;
        }
        return null;
      },
      onChanged: onChanged,
      controller: cepController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: StringsConstants.cep,
        prefixIcon: Icon(Icons.map_outlined),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CepInputFormatter(),
      ],
    );
  }
}
