

import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';
import 'package:travella_01/data/strings.dart';
import 'package:travella_01/models/rota.dart';

import '../temporary_pages/melihinRota.dart';


class routes_item extends StatelessWidget {
  int Route_index= 0;
  final Route_name = [ 
    "Doğa ve Tarih Rotası", 
    "Doğa ve Yayla Rotası",
    "Tarih ve İnanç Rotası", 
    "Tarih ve Plaj Rotası",  
    "Tarih ve Yayla Rotası", 
    "Yayla ve İnanç Rotası", 
    "Yayla ve Deniz Rotası", 
    "Deniz ve İnanç Rotası",
    "Doğa ve Deniz Rotası", 
    
  ];
  
  final  Rota gosterilenRota;
     routes_item({Key? key, required this.gosterilenRota}) : super(key: key);
  final LinearGradient _gradient = LinearGradient(colors: <Color>[ 
    Colors.red, 
    Colors.blue
  ],);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container( 
        
          
          decoration: BoxDecoration( 
            
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ), 
          child:Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: SwipeDeck(
              startIndex: 0,
              aspectRatio:1.3,
              cardSpreadInDegrees: 30,
              widgets: 
               gosterilenRota.foto.map((e) => Container( 
                
                decoration: BoxDecoration( 
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(50))
                  
                ),
                 child: Image.asset("assets/images/$e.jpg",
                 fit: BoxFit.cover,
                 width: 100,
                 scale: 20,
                 height: 30,
                 ),
               )).toList()
              
            ),
          ),

        ),
      Center(child: ShaderMask( 
        shaderCallback: (Rect rect){ 
          return _gradient.createShader(rect);
        },
        child:OutlinedButton(
          onPressed:() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ROTALAR()));
          },
          style: OutlinedButton.styleFrom( 
            side: BorderSide(width: 1.5,color: Colors.lightGreenAccent)

          ),
          child: Text( 
            RotaIsimlendir(gosterilenRota.foto), 
            style:Theme.of(context)
            .textTheme 
            .headline5 
            ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white)
          ),
        ),
      ),
      
      ),
      ],
    );
   
  
    
  }
}

dynamic RotaIsimlendir(List deger) {
  final Route_name = [ 
    "Doğa ve Tarih Rotası", 
    "Doğa ve Yayla Rotası",
    "Tarih ve İnanç Rotası", 
    "Tarih ve Plaj Rotası",  
    "Tarih ve Yayla Rotası", 
    "Yayla ve İnanç Rotası", 
    "Yayla ve Deniz Rotası", 
    "Deniz ve İnanç Rotası",
    "Doğa ve Deniz Rotası", 
    "Doğa ve Tarih Rotası",
  ];
  
  
  if (deger.contains("doğa")){ 
    return Route_name[0];
  }else if(deger.contains("doğa_2")){ 
    return Route_name[1];
  }else if(deger.contains("tarih_2")){ 
    return Route_name[2]; 
  }else if(deger.contains("plaj")){ 
    return Route_name[3];
  }else if(deger.contains("tarih_4")){ 
    return Route_name[4];
  }else if(deger.contains("yayla_3")){ 
    return Route_name[5];
  }else if(deger.contains("deniz")){ 
    return Route_name[6];
  }else if(deger.contains("deniz_2")){ 
    return Route_name[7];
  }else if(deger.contains("doğa_3")){ 
    return Route_name[8];
  }
  
}