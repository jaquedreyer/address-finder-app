import 'package:cep_finder/features/address/data/datasources/address_datasource.dart';
import 'package:cep_finder/features/address/domain/entities/address.dart';
import 'package:cep_finder/features/address/domain/repositories/address_repository.dart';

// Repository e o responsavel por acessar as informacoes de algum datasource e fazer a conversao do model para a entidade
// Tambem ficam com a responsabilidade de decidir de qual datasource (quando tiver varios, do cache, remoto, etc)

class AddressRepositoryImpl implements AddressRepository {
  final AddressDatasource datasource;

  AddressRepositoryImpl({required this.datasource});

  @override
  Future<Address> getAddress(String cep) async {
    final model = await datasource
        .getAddress(cep); // Chamar o datasource, receber model e retorna address
    return Address(
        streetName: model.logradouro,
        neighborhood: model.bairro,
        city: model.localidade,
        uf: model.uf);
  }
}
