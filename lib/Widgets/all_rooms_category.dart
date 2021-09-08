import 'package:flutter/material.dart';
import 'package:smart_home/Constants/fonts.dart';
import 'package:smart_home/Widgets/categorys_card.dart';


class AllRoomsCategory extends StatelessWidget {
  const AllRoomsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width ,
                 decoration: BoxDecoration(
                   color: Color.fromRGBO(239,246,250,5),
                     borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                   )
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.only(left: 20,top: 20),
                       child: Text("All Rooms",style: ksubHeading,),
                     ),
                     Expanded(child: CategorysCards())
                   ],
                 ),
               );
  }
}