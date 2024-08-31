import 'package:cep_finder/features/address/domain/entities/address.dart';
import 'package:cep_finder/utils/constants/images.dart';
import 'package:flutter/material.dart';

class CustomCepResultWidget extends StatelessWidget {
  final String cardTitle;
  final Address address;

  const CustomCepResultWidget(
      {super.key, required this.address, required this.cardTitle});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
           leading: Image.asset(
                        AppImages.logo,
                        width: 35,
                        height: 35,
                      ),
            title: Text(
              cardTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                '${address.streetName}, ${address.neighborhood}, ${address.city} - ${address.uf}'),
          ),
        ],
      ),
    );
  }
}
