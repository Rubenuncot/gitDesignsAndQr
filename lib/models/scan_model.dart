import 'dart:convert';

class ScanModel {
    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    }){
        if(valor.contains('http')){
            tipo = 'http';
        } else {
            tipo = 'geo';
        }
    }

    int? id;
    String? tipo;
    String valor;

    factory ScanModel.fromRawJson(String str) => ScanModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
