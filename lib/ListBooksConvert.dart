// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ListadoLibros> listadoLibrosFromJson(String str) => List<ListadoLibros>.from(json.decode(str).map((x) => ListadoLibros.fromJson(x)));

String listadoLibros(List<ListadoLibros> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListadoLibros {
    ListadoLibros({
        required this.calificado,
   required     this.cantidad,
    required    this.idLibro,
   required     this.autor,
 required       this.nombre,
   required     this.userId,
   required     this.fechaCreacion,
   required     this.upload_logo,
    });

    List<Calificado> calificado;
    int cantidad;
    int idLibro;
    String autor;
    String nombre;
    int userId;
    dynamic fechaCreacion;
    String upload_logo;

    factory ListadoLibros.fromJson(Map<String, dynamic> json) => ListadoLibros(
        calificado: List<Calificado>.from(json["calificado"].map((x) => Calificado.fromJson(x))),
        cantidad: json["cantidad"],
        idLibro: json["id_libro"],
        autor: json["autor"],
        nombre: json["nombre"],
        userId: json["user_id"],
        fechaCreacion: json["fecha_creacion"],
        upload_logo: json["upload_logo"],
    );

    Map<String, dynamic> toJson() => {
        "calificado": List<dynamic>.from(calificado.map((x) => x.toJson())),
        "cantidad": cantidad,
        "id_libro": idLibro,
        "autor": autor,
        "nombre": nombre,
        "user_id": userId,
        "fecha_creacion": fechaCreacion,
        "upload_logo":upload_logo,
    };
}

class Calificado {
  

    Calificado({
      required     this.id,
   required     this.status,
   
    });

    int status;
    int id;

    factory Calificado.fromJson(Map<String, dynamic> json) => Calificado(
        id: json["id"],
        status: json["status"],
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
    };
}
