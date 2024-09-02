import 'package:cep_finder/features/address/domain/entities/address.dart';

abstract class AddressRepository {
  Future<Address> getAddress (String cep);
}