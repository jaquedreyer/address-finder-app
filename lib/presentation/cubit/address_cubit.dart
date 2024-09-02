import 'package:bloc/bloc.dart';
import 'package:cep_finder/features/address/domain/entities/address.dart';
import 'package:cep_finder/features/address/domain/usecases/get_address_info_usecase.dart';
import 'package:equatable/equatable.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit({required this.getAddressInfoUsecase}): super(AddressInitial());

final GetAddressInfoUsecase getAddressInfoUsecase;

  void getAddress (String cep) async {
    emit(AddressLoading());
    try {
      final address = await getAddressInfoUsecase.call(cep);
      emit(AddressLoaded(address));
    } catch (e) {
      emit(AddressError());

    }
  }
}
