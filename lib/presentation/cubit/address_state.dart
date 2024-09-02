part of 'address_cubit.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final Address address;

  const AddressLoaded(this.address);

  @override
  List<Object> get props => [address];
}

class AddressError extends AddressState {}
