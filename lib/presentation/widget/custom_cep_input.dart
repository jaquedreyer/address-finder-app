import 'package:cep_finder/utils/cep_input_formatter.dart';
import 'package:cep_finder/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomCepInputWidget extends StatefulWidget {
  const CustomCepInputWidget({super.key});

  @override
  State<CustomCepInputWidget> createState() => _CustomCepInputWidgetState();
}

class _CustomCepInputWidgetState extends State<CustomCepInputWidget> {
  final _formKey = GlobalKey<FormState>();
  final _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return StringsConstants.cepValido;
          } else if (value.length != 8) {
            return StringsConstants.cep8digitos;
          }
          return null;
        },
        controller: _cepController,
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
      ),
    );
  }
}
