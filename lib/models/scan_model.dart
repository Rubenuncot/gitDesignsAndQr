import 'dart:convert';

class ScanModel {
    ScanModel({
        required this.id,
        required this.tipo,
        required this.valor,
    });

    int id;
    String tipo;
    String valor;

    factory ScanModel.fromRawJson(String str) => ScanModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["ipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ipo": tipo,
        "valor": valor,
    };
}
