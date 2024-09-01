// Implementa a entidade adicionando os metodos fromjson e tojson

class AddressModel {
    final String cep;
    final String logradouro;
    final String complemento;
    final String unidade;
    final String bairro;
    final String localidade;
    final String uf;
    final String ibge;
    final String gia;
    final String ddd;
    final String siafi;

    AddressModel({
        required this.cep,
        required this.logradouro,
        required this.complemento,
        required this.unidade,
        required this.bairro,
        required this.localidade,
        required this.uf,
        required this.ibge,
        required this.gia,
        required this.ddd,
        required this.siafi,
    });

    AddressModel copyWith({
        String? cep,
        String? logradouro,
        String? complemento,
        String? unidade,
        String? bairro,
        String? localidade,
        String? uf,
        String? ibge,
        String? gia,
        String? ddd,
        String? siafi,
    }) => 
        AddressModel(
            cep: cep ?? this.cep,
            logradouro: logradouro ?? this.logradouro,
            complemento: complemento ?? this.complemento,
            unidade: unidade ?? this.unidade,
            bairro: bairro ?? this.bairro,
            localidade: localidade ?? this.localidade,
            uf: uf ?? this.uf,
            ibge: ibge ?? this.ibge,
            gia: gia ?? this.gia,
            ddd: ddd ?? this.ddd,
            siafi: siafi ?? this.siafi,
        );

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        unidade: json["unidade"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        ibge: json["ibge"],
        gia: json["gia"],
        ddd: json["ddd"],
        siafi: json["siafi"],
    );

    Map<String, dynamic> toJson() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "unidade": unidade,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "ibge": ibge,
        "gia": gia,
        "ddd": ddd,
        "siafi": siafi,
    };
}
