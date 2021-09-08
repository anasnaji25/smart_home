import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/Constants/fonts.dart';
import 'package:smart_home/Widgets/all_rooms_category.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[800],
         body: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Stack(
               children: [
                 Container(
                   height: 170,
                 ),
                 Positioned(
                     top: 50,
                     left: -82,
                     height: 420,
                     child: SvgPicture.asset("assets/images/Circles.svg",)),

                    Positioned(
                     top: -265,
                     left: -290,
                     height: 420,
                     child: SvgPicture.asset("assets/images/Circles.svg",)),

                      Positioned(
                     top: 55,
                     left: 20,
                     width:size.width,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:[
                           Container(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                   width: 110,
                                  child: Text("Control Panel",style: kmainHeadingstyle,)),
                                //  Text("Panel",style: kmainHeadingstyle,),
                            
                               ],
                             ),
                           ),
                           
                          Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Image.asset("assets/images/user.png")
                                  )
                              
                         ]
                       ),
                     ),

               ],
             ),
             Expanded(
               child: AllRoomsCategory()
             ),
           ],
         ),
         bottomNavigationBar: Container(
           height: 70,
           color: Colors.grey[50],
           
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               SvgPicture.asset('assets/images/bulb.svg'),
               SvgPicture.asset('assets/images/Icon feather-home.svg'),
               SvgPicture.asset('assets/images/Icon feather-settings.svg')
             ],
           ),
         ),
    );
  }
}