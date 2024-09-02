import 'dart:convert';
import 'dart:developer';

import 'package:cep_finder/features/address/data/models/address_model.dart';
import 'package:http/http.dart' as http;

abstract class AddressDatasource {
  Future<AddressModel> getAddress(String cep);
}

class ApiAddressDataSource implements AddressDatasource {
  @override
  Future<AddressModel> getAddress(String cep) async {
    try {
      final response =
          await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json'));
      if (response.statusCode == 200) {
        final body = response.body;
        return AddressModel.fromJson(jsonDecode(body));
      }
       throw Exception('Erro ao buscar o endereço');
    } catch (e, s) {
      log(
        'Erro ao buscar endereço. Erro: $e',
        stackTrace: s,
        name: 'AddressDataSource',
      );
      rethrow;
    }
  }
}

// Mock data
// class MockAddressDataSource implements AddressDatasource {
//   @override
//   Future<AddressModel> getAddress(String cep) async {
//     await Future.delayed(const Duration(seconds: 2));
//     return AddressModel(
//       cep: 'cep',
//       logradouro: 'logradouro',
//       complemento: 'complemento',
//       unidade: 'unidade',
//       bairro: 'bairro',
//       localidade: 'santa maria',
//       uf: 'RS',
//       ibge: 'ibge',
//       gia: 'gia',
//       ddd: 'ddd',
//       siafi: 'siafi',
//     );
//   }
// }
