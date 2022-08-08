


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travella_01/discover_page/discover.dart';
import 'package:travella_01/drawer_part.dart';
import 'package:travella_01/profile_page/profil.dart';
import 'package:travella_01/profile_page/tabbar.dart';


import 'package:travella_01/temporary_pages/profile.dart';
import 'package:travella_01/temporary_pages/temp_route.dart';

import 'temporary_pages/mainpage.dart';
import 'temporary_pages/temp_nav_page.dart';







class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  int index = 2;
  int currentPage = 0;
   
   final ScreenName = [ 
    "KEŞFET", 
    "HARİTA", 
    "", 
    "ROTALAR", 
    "PROFİL"
   
   ];
   
   final screens = [
   
    discover(),
    temp_nav(),
    main_page(), 
    temp_route(),
    ProfilPage(),
  ];
  
  



  var  mainColor =  Color.fromARGB(255, 0, 202, 157);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      extendBody: true,
      drawer: Drawer( 
                child:DrawerIcerigi(),
              ),
              appBar: AppBar(
                centerTitle: true,
                title: Text(ScreenName[index]),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,
                
                 
                actions: [ 
                  IconButton(
                    icon:Icon(Icons.notifications_none), 
                    onPressed: () {
                      
                    },
                    iconSize: 30,
                  ),
                  
                ],
              backgroundColor: mainColor,            
            ),
      //appBar: AppBarLayout(), bu app bar'ı sayfalarda kendi alanlarınıza koyacaksınız
      body: screens[index],
      bottomNavigationBar: bottomNavBar(context),
      //AnaSayfaCenterWidget(),
      
    );
  }


//bottomNavBar
  Theme bottomNavBar(BuildContext context) {
    final menuIcons = <Widget>[
      Icon(
        CupertinoIcons.compass,
        size: 30,
      ),
      Icon(
        CupertinoIcons.location_north_fill,
        size: 30,
      ),
      Icon(Icons.home_sharp, 
        size:30),
      
      Icon(Icons.place_rounded,  
        size:30),
      
      Icon(Icons.account_circle, 
        size: 30),
    
      
    ];
    //yorum satırı
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      child: CurvedNavigationBar(
        buttonBackgroundColor:mainColor,
        color: mainColor,
        backgroundColor:Colors.transparent,
        height: 50,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 250),
        index: index,
        items: menuIcons,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
//yorum satırı
  
}