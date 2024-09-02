import 'package:cep_finder/features/address/domain/entities/address.dart';
import 'package:cep_finder/features/address/domain/repositories/address_repository.dart';

// No caso de uso ja uso a implementacao em si, geralmente nao tem abstracao para caso de uso
class GetAddressInfoUsecase {
  final AddressRepository repository;

  GetAddressInfoUsecase({
    required this.repository,
  });

// Faz a chamada pra classe abstrata repository
  Future<Address> call(String cep) {
    return repository.getAddress(cep);
  }
}
