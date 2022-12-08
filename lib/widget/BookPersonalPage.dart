
import 'package:quickalert/quickalert.dart';

import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:bookcity/main.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:like_button/like_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'dart:convert';
import 'dart:io';
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

class BookPersonalPage extends StatefulWidget {
  const BookPersonalPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BookPersonalPage> createState() => _BookPersonalPageState();
}

class _BookPersonalPageState extends State<BookPersonalPage> {
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

    super.initState();
  }


  String nombre ="";
  String autor  ="";
  String logo ="";
  



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    const double buttonSize = 40.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0070eb),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Crear Libro",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ],
        ),

        centerTitle: true, // this is all you need

        leading: IconButton(
          icon: const Icon(Icons.menu, color: const Color(0xFFD5CFBF)),
          onPressed: () {},
        ),
      ),
      body:
//bodybirdmorfo(morfo: widget.morfo, imagenm: widget.imagenm)

          Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


             
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical:8 ),
              child: TextFormField (
                    textDirection: TextDirection.ltr,

                style: TextStyle(color:  const Color(0xFF0070eb),),

                onChanged: (value) {
                  
                    nombre = value.toUpperCase();
                  
                },
                
  decoration: InputDecoration(
        
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color:  Colors.blue.shade900),
    ),
      enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color:  const Color(0xFF0070eb),),
    ),
        labelText: "Ingrese Nombre Libro",
               labelStyle: TextStyle( fontSize: size.width*0.03,color:  const Color(0xFF0070eb),),

     isDense: true,    
        
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),  borderSide: new BorderSide(color:   const Color(0xFF0070eb),))),
      ),
              ),
            
         Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical:8 ),
              child: TextFormField (

                
                    textDirection: TextDirection.ltr,

                
                style: TextStyle(color:  const Color(0xFF0070eb),),

                onChanged: (value) {
                  
                    autor = value.toUpperCase();
                  
                },
                
  decoration: InputDecoration(
        
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color:  Colors.blue.shade900),
    ),
      enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color:  const Color(0xFF0070eb),),
    ),
        labelText: "Ingrese Autor Libro",
               labelStyle: TextStyle( fontSize: size.width*0.03,color:  const Color(0xFF0070eb),),

     isDense: true,    
        
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),  borderSide: new BorderSide(color:   const Color(0xFF0070eb),))),
      ),
              ),
                       Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical:8 ),
              child: TextFormField (
                    textDirection: TextDirection.ltr,

           
                style: TextStyle(color:  const Color(0xFF0070eb),),

                onChanged: (value) {
                  
             logo = value;
                  
                },
                
  decoration: InputDecoration(
        
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color:  Colors.blue.shade900),
    ),
      enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color:  const Color(0xFF0070eb),),
    ),
        labelText: "Ingrese la url de la imagen del Libro",
               labelStyle: TextStyle( fontSize: size.width*0.03,color:  const Color(0xFF0070eb),),

     isDense: true,    
        
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),  borderSide: new BorderSide(color:   const Color(0xFF0070eb),))),
      ),
              ),

          LikeButton(
            onTap: (isLiked) => onLikeButtonTapped2(
                isLiked, nombre, autor, logo),
            size: 190,
            circleColor: const CircleColor(
                start: const Color(0xFF0070eb), end: const Color(0xFF0070eb)),
            bubblesColor: const BubblesColor(
              dotPrimaryColor: const Color(0xFF0070eb),
              dotSecondaryColor: const Color(0xFF0070eb),
            ),
            likeBuilder: (isLikedss) {
              return SingleChildScrollView(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: const Color(0xFF0070eb),
                    size: buttonSize,
                  ),
                  SizedBox(
                    width: 150.0,
                    child: TextLiquidFill(
                      waveDuration: const Duration(seconds: 360),
                      loadDuration: const Duration(seconds: 360),
                      text: "Crear Libro",
                      waveColor: Colors.blue.shade900,
                      boxBackgroundColor: const Color(0xFF0070eb),
                      textStyle: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                      boxHeight: 40.0,
                    ),
                  )
                ],
              ));
            },
          ),
        ],
      ),

    );
  }

  sendRequest() async {
    setState(() {
      isLikeds = true;
    });

    return true;
  }

  bool isLikeds = false;
  Future<bool> onLikeButtonTapped2(
      bool isLiked, String nombre, String autor, String logo) async {
    /// send your request here
    final bool success = await sendRequest();

    setState(() {
      isLikeds = success ? !isLiked : isLiked;
    });
    var t = sendRequestt2(nombre, autor, logo);

    /// if failed, you can do nothing
    return success ? !isLiked : isLiked;
  }

  sendRequestt2(String nombre, String autor, String logo) async {
    await Future.delayed(const Duration(seconds: 2), () {
      fetchShowspost( nombre,autor, logo);
    });
  }

  Future<List> fetchShowspost(String nombre1 , String autor1, String logo1) async {

     var responseListProducts;
if(nombre1 =="" || autor1 =="" || logo1 =="")
{
        QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          autoCloseDuration: const Duration(seconds: 3),
          text: '',
          confirmBtnTextStyle: TextStyle(color: Color(0xFFb5bc25)),
          title: "Error",
          confirmBtnText: "Por favor Valide todos campos",
          confirmBtnColor: Color(0xFF427382),
          onConfirmBtnTap: () {
              Navigator.of(context).pop();
          },
        );
}
else
{


    
     

        final response =
        await http.post(Uri.parse('http://192.168.10.59:8000/api/createbook/?nombre='+nombre1+'&upload_logo='+logo1+'&autor='+autor1+'&user_id=1'));

    if (response.statusCode == 201) {
      

      await Future.delayed(const Duration(seconds: 1), () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          autoCloseDuration: const Duration(seconds: 3),
          text: '',
          confirmBtnTextStyle: TextStyle(color: Color(0xFFb5bc25)),
          title: "Felicidades",
          confirmBtnText: "Libro creado correctamente",
          confirmBtnColor: Color(0xFF427382),
          onConfirmBtnTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BooklistPage()),
            );
          },
        );
      });

      await Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BooklistPage()),
        );
      });
      return responseListProducts;
    } else {
      throw Exception('Failed to load shows');
    }

}
      return responseListProducts;
  }

  Widget llegara(int listSales, var nombre, var apellido, var cedula,
      var status, var size, BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(180),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth()
      },
      border: TableBorder.all(
          width: 1, color: Color(0xFFb5bc25), style: BorderStyle.none),
      children: [
        TableRow(children: [
          Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Column contents vertically,
              crossAxisAlignment: CrossAxisAlignment
                  .center, //Center Column contents horizontally,

              children: [
                //       Icon(Icons.account_box, size: 12,),
                //       Text('Producto')
              ]),
          Column(children: [
            //     Icon(Icons.account_box, size: 12,),
            //     Text('Qty')
          ]),
          Column(children: [
            //     Icon(Icons.account_box, size: 12,),
            //     Text('Qty')
          ]),
        ]),
        TableRow(children: [
          InkWell(
              onTap: () async {},
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                              width: size.width * 1,
                              height: size.height * 0.1,
                              padding: const EdgeInsets.only(top: 1, left: 1),
                              child: Column(
                                children: [
                                  Text(
                                    nombre.toUpperCase(),
                                    style: TextStyle(
                                      color: Color(0xFF427382),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    apellido.toUpperCase(),
                                    style: TextStyle(
                                      color: Color(0xFF427382),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                        ],
                      )))),
          Center(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: new TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Color(0xFF427382)),
                  textAlign: TextAlign.center,
                  onSubmitted: (value) async {},
                  autofocus: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFFb5bc25)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFF427382)),
                    ),
                    labelText: cedula.toString(),
                    labelStyle: TextStyle(
                      fontSize: size.width * 0.02,
                      color: Color(0xFF427382),
                      fontWeight: FontWeight.bold,
                    ),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: new BorderSide(color: Color(0xFF427382))),
                  ),
                )),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: size.width * 1,
              height: size.height * 0.1,
              padding: const EdgeInsets.all(15),
              child: Text(
                status == 1 ? "Activado" : "Desactivado",
                style: TextStyle(
                  color: Color(0xFF427382),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ))
        ]),
      ],
    );
  }
}
