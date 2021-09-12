import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/Components/category_items.dart';
import 'package:smart_home/Constants/fonts.dart';



class CategorysCards extends StatelessWidget {
  const CategorysCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return GridView.builder(
      shrinkWrap: true,
      itemCount: category_items.length,
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2.4),), itemBuilder: (context,index){
         return InkWell(
           onTap: (){
             if(category_items[index]["page"] != ""){
            //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> category_items[index]["page"]));
                    

  Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (c, a1, a2) => category_items[index]["page"],
    transitionsBuilder: (c, anim, a2, child) {
        anim = CurvedAnimation(parent: anim, curve: Curves.easeIn);
      return FadeTransition(opacity: anim, child: child);
    },
    transitionDuration: Duration(milliseconds: 650),
  ),
);
    }
           },
           child: Container(
             margin: const EdgeInsets.fromLTRB(15, 0, 15, 25),
               decoration: BoxDecoration(
                 color: Color.fromRGBO(246, 253, 255, 5),
                boxShadow: <BoxShadow>[
                 BoxShadow(
                     color: Colors.white10,
                     blurRadius: 5.0,
                 )
               ],
                   borderRadius: BorderRadius.circular(22), ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                     child: SvgPicture.asset(category_items[index]["image"]),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: Text(category_items[index]["category_name"],style: kCategorynameStyle,),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: Text(category_items[index]["sub_heading"],style: kCsubHeadingnameStyle,),
                   )
                 ],
               ),
             ),
         );
      });
  }
}