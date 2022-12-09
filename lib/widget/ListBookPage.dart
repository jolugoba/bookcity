
import 'package:adobe_xd/adobe_xd.dart';
import 'package:bookcity/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bookcity/ListBooksCreateConvert.dart';
import 'package:bookcity/widget/BookPersonalPage.dart';

import 'package:progress_indicators/progress_indicators.dart';
import 'package:like_button/like_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'dart:convert';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


class ListBookCreates extends StatefulWidget {
  const ListBookCreates({
    Key? key,
  }) : super(key: key);

  @override
  State<ListBookCreates> createState() => _ListBookCreatesState();
}

class _ListBookCreatesState extends State<ListBookCreates> {
  bool cbuttom1 = true;
  bool cbuttom2 = true;
  bool cbuttom3 = true;

  bool fbuttom1 = false;
  bool fbuttom2 = true;
  bool fbuttom3 = true;
  bool fbuttom4 = true;
  bool aplay = true;

  @override
  void initState() {
    // TODO: implement initState
    shows = fetchShows(context);
    super.initState();
  }

  String searchString = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0070eb),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
        Text("Listado de Libros Creados",
         textAlign:TextAlign.justify,
                style: TextStyle(
                  
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
         
          ],
        ),

        centerTitle: true, // this is all you need

        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {       Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BooklistPage()),
                );},
        ),
      ),
      body:
//bodybirdmorfo(morfo: widget.morfo, imagenm: widget.imagenm)
 new SizedBox( 
        height: size.height,
        child:


        Expanded(child:
          Column(
      
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookPersonalPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Crear Libro",style: TextStyle(color: const Color(0xFF0070eb),
                            fontSize: size.height * 0.028,
                            fontWeight: FontWeight.bold,)),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: IconButton(
                      icon:
                          const Icon(Icons.add, color: const Color(0xFF0070eb)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            
            Center(
                child: Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, right: 20.5, left: 20.7, bottom: 20),
                    child: Text(
                        "Los Libros actualmente que se encuentran son:",
                        style: TextStyle(
                            fontSize: size.height * 0.024,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0070eb))))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                style: TextStyle(color: const Color(0xFF0070eb)),
                onChanged: (value) {
                  setState(() {
                    searchString = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: const Color(0xFF0070eb)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color:const Color(0xFF0070eb)),
                  ),
                  labelText: "Buscar",
                  labelStyle: TextStyle(
                      fontSize: size.width * 0.03, color: const Color(0xFF0070eb)),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: new BorderSide(color:const Color(0xFF0070eb))),
                ),
              ),
            ),
            SizedBox(height: 10),
            Table(columnWidths:  {
               0: FixedColumnWidth(size.width *0.4),
        1: FlexColumnWidth( size.width *0.002),
              2: FlexColumnWidth()
            }, children: [
              TableRow(children: [
                Column(children: [
                  Icon(
                    Icons.account_box,
                    size: size.width * 0.04,
                    color: const Color(0xFF0070eb),
                  ),
                  Text(
                    'Libro',
                    style: TextStyle(
                      color: const Color(0xFF0070eb),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
                Column(children: [
                  Icon(Icons.account_box,
                      size: size.width * 0.04, color: const Color(0xFF0070eb)),
                  Text(
                    'Imagen',
                    style: TextStyle(
                      color: const Color(0xFF0070eb),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
                Column(children: [
                  Icon(Icons.account_box,
                      size: size.width * 0.04, color: const Color(0xFF0070eb)),
                  Text(
                    'Id:Libro',
                    style: TextStyle(
                      color: const Color(0xFF0070eb),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ])
            ]),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(),
              width: size.width - 1.0,
              height: size.height * 0.1,
              child: FutureBuilder(
                builder: (context,
                    AsyncSnapshot<List<ListBooksCreateConvert>?> snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return snapshot.data![index].id
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchString) ||
                                  snapshot.data![index].nombre
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchString)||
                                  snapshot.data![index].autor
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchString)||
                                  snapshot.data![index].createdAt
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchString)
                              ? InkWell(
                                  onTap: () {
                     
                                  },
                                  child: Container(
                                
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                     Color(0xFF0070eb),
                                            Colors.blue.shade900
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            //<-- 1. SEE HERE
                                            side: BorderSide(
                                              color:   Color(0xFF0070eb),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: llegara(
                                            index,
                                         "", snapshot.data![index].id, snapshot.data![index].id,  
                                        
                                            size,
                                            context,snapshot.data![index].uploadLogo  ,snapshot.data![index].autor,snapshot.data![index].nombre,snapshot.data![index].userId.toString(), snapshot.data![index].createdAt.toString(),
                                          ))))
                              : Container();
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return snapshot.data![index].nombre
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchString) ||
                                  snapshot.data![index].autor
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchString)
                              ? Container()
                              : Container();
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('No hay resultados.',
                            textStyle: TextStyle(
                              fontSize: size.width * 0.09,
                              color: Colors.white,
                              backgroundColor:   Color(0xFF0070eb),
                            )),
                      ],
                      isRepeatingAnimation: true,
                      repeatForever: true,
                      pause: Duration(milliseconds: 1000),
                    ));
                  }
                  return Center(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlowingProgressIndicator(
                        child: SizedBox(
                          height:size.height * 0.2 
                          ,width: size.width * 0.9,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(

                                'assets/images/logo.png',
                                 fit: BoxFit.fitHeight,
                              )),
                        ),
                      ),
                    ],
                  ));
                },
                future: shows,
              ),
            ))
          ]))));

  }
String id = "";
  Widget llegara(int listSales, var nombre, var id_libro, var cantidad,
     var size, BuildContext context, String logo,String autorl, String nombrel, String idusuario , String fecha) {

        
    var size = MediaQuery.of(context).size;
    return Table(
      
      columnWidths:  {
         0: FixedColumnWidth(size.width *0.5),
        1: FlexColumnWidth( size.width *0.001),
        2: FlexColumnWidth()
      },
      border: TableBorder.all(
          width: 1, color:  Color(0xFF0070eb), style: BorderStyle.none),
      children: [
        TableRow(children: [
          Column(
  
              children: [
                //       Icon(Icons.account_box, size: 12,),
                //       Text('Producto')
              ]),
          Column(
       
            children: [
            //     Icon(Icons.account_box, size: 12,),
            //     Text('Qty')
          ]),
          Column(
   
            children: [
            //     Icon(Icons.account_box, size: 12,),
            //     Text('Qty')
          ]),
        ]),
        TableRow(children: [
          InkWell(
              onTap: () async {},
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        
                        children: [
                          Container(
                     
                              padding: const EdgeInsets.only(top: 1, left: 1),
                              child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                
                                children: [
                                  Text(
                                    "Nombre Libro: " + nombrel.toUpperCase(),
                                    style: TextStyle(
                                            fontSize: size.width *0.025,
                                      color:  Color(0xFF0070eb),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  Text(
                                    "Autor Libro : " + autorl.toString(),
                                    style: TextStyle(
                                               fontSize: size.width *0.025,
                                      color:  Color(0xFF0070eb),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                          
                                                          Text(
                                    "Fecha Creación : "+ fecha,
                                    style: TextStyle(
                                            fontSize: size.width *0.025,
                                      color:  Color(0xFF0070eb),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                                     Text(
                                    "Usuario Id : " + idusuario.toString(),
                                    style: TextStyle(
                                                fontSize: size.width *0.025,
                                      color:  Color(0xFF0070eb),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              )),
                        ],
                      )))),
    Container(
               height: size.height*0.15,
                        width: size.width*0.09,
                 padding: const EdgeInsets.all(1),
            child: Padding(
                padding: const EdgeInsets.all(1),
                child:  
                  Positioned(
                      bottom: 1,
                      
                      child: Image.network(
                        logo,
                     
                      ),
                    )
                
                ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: size.width * 1,
              height: size.height * 0.1,
              padding: const EdgeInsets.all(15),
              child: 
              
              
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [


           
                         Text(
 cantidad.toString()
               ,
                style: TextStyle(
                fontSize: size.width * 0.02,
                  color:   Color(0xFF0070eb),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
],)
            ),
          ))
        ]),
      ],
    );
  }

  

  Future<List<ListBooksCreateConvert>> fetchShows(BuildContext context) async {
    var responseListProducts;
Future<List<ListBooksCreateConvert>>  showss;
    final response =
        await http.get(Uri.parse('http://201.216.8.37:8000/api/porlibroscreados?user_id=1'));

    if (response.statusCode == 200) {


      responseListProducts =
         listBooksCreateConvertFromJson(utf8.decode(response.bodyBytes));  

                          



  
        //final parsedJson = jsonDecode(response.body);
  
 // var chat1 = jsonDecode(response.body) as Future<List<ListadoLibros>>;
   //     chat = chat1 as List;
        //libritos =    listadoLibrosFromJson(utf8.decode(response.bodyBytes)) as List<ListadoLibros>;  
  
          
            
         //   shows =libritos;
          
      // var topShowsJson = jsonDecode(response.body)['top'] as List;
      //return chat.map((show) => Showbalin.fromJson(show)).toList();
      // var topShowsJson = jsonDecode(response.body)['top'] as List;
      return responseListProducts;
    } else {
      
      throw Exception('Failed to load shows');
    }
  }

  Future<List<ListBooksCreateConvert>?>? shows;
}
