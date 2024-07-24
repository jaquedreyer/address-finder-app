class AddressModel {
  final String cep;
  final String street;
  final String neighborhood;
  final String city;
  final String stateAbbreviation;

  AddressModel({
    required this.cep,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.stateAbbreviation,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: json['cep'] ?? '',
      street: json['logradouro'] ?? '',
      neighborhood: json['bairro'] ?? '',
      city: json['localidade'] ?? '',
      stateAbbreviation: json['uf'] ?? '',
    );
  }
}
