// To parse this JSON data, do
//
//     final listBooksCreateConvert = listBooksCreateConvertFromJson(jsonString);

import 'dart:convert';

List<ListBooksCreateConvert> listBooksCreateConvertFromJson(String str) => List<ListBooksCreateConvert>.from(json.decode(str).map((x) => ListBooksCreateConvert.fromJson(x)));

String listBooksCreateConvertToJson(List<ListBooksCreateConvert> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListBooksCreateConvert {
    ListBooksCreateConvert({
      required  this.id,
   required     this.createdAt,
    required    this.updatedAt,
    required    this.uploadLogo,
     required   this.nombre,
     required   this.autor,
    required    this.userId,
    });

    int id;
    DateTime createdAt;
    DateTime updatedAt;
    String uploadLogo;
    String nombre;
    String autor;
    int userId;

    factory ListBooksCreateConvert.fromJson(Map<String, dynamic> json) => ListBooksCreateConvert(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        uploadLogo: json["upload_logo"],
        nombre: json["nombre"],
        autor: json["autor"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "upload_logo": uploadLogo,
        "nombre": nombre,
        "autor": autor,
        "user_id": userId,
    };
}
