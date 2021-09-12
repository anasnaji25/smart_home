import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/Constants/fonts.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BedRoomPage extends StatefulWidget {
  BedRoomPage({Key? key}) : super(key: key);

  @override
  _BedRoomPageState createState() => _BedRoomPageState();
}

class _BedRoomPageState extends State<BedRoomPage> with TickerProviderStateMixin {

  double sliderValue = 20.0;
   final GlobalKey<InOutAnimationState> inOutAnimation =
      GlobalKey<InOutAnimationState>();
       late AnimationController controller;
  late Animation growAnimation;

    late AnimationController circlesCn;
  late Animation makeround;

  late AnimationController bulbCn;
  late Animation pulldown;

  @override
void initState() {
  super.initState();
  controller = AnimationController(vsync: this, duration: Duration(milliseconds: 690));
  growAnimation = Tween<double>(begin: 0, end: 1000).animate(controller)..addListener(() {
       setState(() {
         
         sliderValue = growAnimation.value.roundToDouble();
       });
   });
  controller.forward();

  circlesCn  = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  makeround = Tween<double>(begin: 1, end: 0).animate(circlesCn)..addListener(() {
       setState(() {
       });
   });
   circlesCn.forward();


  bulbCn  = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  pulldown = Tween<double>(begin: 0, end: 30).animate(new CurvedAnimation(
  parent: bulbCn,
  curve: Curves.easeInQuad
))..addListener(() {
       setState(() {
       });
   });
   bulbCn.forward();
    changeBulb();
}

 int bcolor1 = 255,bcolor2 = 215,bcolor3 = 0;
 double oppacity = 0.6;
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
     controller.dispose();
     circlesCn.dispose();
     bulbCn.dispose();
  }

bool bulbChange = false;
  changeBulb(){
     Future.delayed(Duration(seconds: 3), () async {
       setState(() {
         bulbChange = true;
       });
    });
  }


  setBulbColors(int val1,val2,val3){
    setState(() {
      
      bcolor1 = val1;
      bcolor2 = val2;
      bcolor3 = val3;
    });
  }

  intensityChanger(){
      if(sliderValue <= 100){
        setState(() { 
          oppacity = 0.2;
        });
      }else if(sliderValue <= 200){
        setState(() { 
          oppacity = 0.3;
          
        });
      }else if(sliderValue <= 400){
        setState(() { 
          oppacity = 0.4;
          
        });
      }else if(sliderValue <= 600){
        setState(() { 
          oppacity = 0.5;
          
        });
      }
      else if(sliderValue <= 800){
        setState(() { 
          oppacity = 0.6;
          
        });
      }
  }


  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[800],
         body: SafeArea(
           child: Stack(
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Stack(
                     children: [
                       Container(
                         height: 278.h,
                       ),
                       Positioned(
                           top: -50,
                           left: -100,
                           height: 520.h,
                           child: Transform.rotate(
                             angle: makeround.value,
                             child: SvgPicture.asset("assets/images/Circles.svg",))),
                        bulbChange ?  Positioned(
                                   top: 115,
                                   right: 94,
                                   child: Container(
                                         height: 21.h,
                                         width: 21.w,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                 BoxShadow(
                                color: Color.fromRGBO(bcolor1, bcolor2, bcolor3, oppacity),
                               blurRadius: 5.0,
                               spreadRadius: 2.0,
                             ),
                          ],
                            color:  Color.fromRGBO(bcolor1, bcolor2, bcolor3, oppacity),
                                   borderRadius: BorderRadius.all(Radius.circular(40))
                                      ),
                                                             
                                      ),
                                 ) : Container(),
                         bulbChange ? Positioned(
                           top: 3,
                           right: 35,
                           child: SvgPicture.asset("assets/images/Group 38.svg",)) : Container(),

                           bulbChange == false ? Positioned(
                           top: 3,
                           right: 35,
                           child: FadeInDown(
                             key: inOutAnimation,
                             preferences: AnimationPreferences(duration: Duration(seconds: 3)),
                             child: SvgPicture.asset("assets/images/light bulb.svg",))) : Container(),
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
                                       Row(
                                         children: [
                                                InkWell(
                                                  onTap: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: SvgPicture.asset("assets/images/Icon ionic-md-arrow-round-back.svg",),
                                                  ),
                                                ),
                                               Text("Bed",style: kmainHeadingstyle,)
                                         ],
                                       ),
                                       Text("Room",style: kmainHeadingstyle,),
                                       FadeInDown(child: Text("4 Lights",style: kCsubHeadingnameStyle2,)),
                                  
                                     ],
                                   ),
                                 ),
                                 
                            
                               ]
                             ),
                           ),
         
         
                             Positioned(
                           top: 190,
                           left: 0,
                           width:size.width,
                             child: FadeInRight(
                               child: Container(
                                 height: 80.h,
                                 child: ListView(
                                   scrollDirection: Axis.horizontal,
                                   children: [
                                     SizedBox(width: 15.w,),
                                        Container(
                                                 height: 20.h,   
                                               width: 140.w,
                                              margin: const EdgeInsets.fromLTRB(0, 0, 15, 25),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(246, 253, 255, 5),
                                                 boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                      color: Colors.white10,
                                                      blurRadius: 1.0,
                                                  )
                                                ],
                                                    borderRadius: BorderRadius.circular(20), ),
                                                child: Row(
                                                  children: [
                                                     Padding(
                                                       padding: const EdgeInsets.only(left: 8),
                                                       child: SvgPicture.asset('assets/images/surface1.svg'),
                                                     ),
                                                     Padding(
                                                      padding: const EdgeInsets.only(left: 8),
                                                       child: Text("Main Light",style:kbedOptionscardTxtStyle),
                                                     )
                                                  ],
                                                )
                                              ),
                                                Container(
                                                 height: 20,   
                                               width: 140,
                                              margin: const EdgeInsets.fromLTRB(0, 0, 15, 25),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(17, 58, 129, 5),
                                                 boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                      color: Colors.white10,
                                                      blurRadius: 1.0,
                                                  )
                                                ],
                                                    borderRadius: BorderRadius.circular(20), ),
                                                child: Row(
                                                  children: [
                                                     Padding(
                                                       padding: const EdgeInsets.only(left: 10),
                                                       child: SvgPicture.asset('assets/images/furniture-and-household.svg'),
                                                     ),
                                                     Padding(
                                                      padding: const EdgeInsets.only(left: 10),
                                                       child: Text("Desk lights",style:kbedOptionscardTxtStyle2),
                                                     )
                                                  ],
                                                )
                                              ),
                                                Container(
                                                 height: 20.h,   
                                               width: 140.w,
                                              margin: const EdgeInsets.fromLTRB(0, 0, 15, 25),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(246, 253, 255, 5),
                                                 boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                      color: Colors.white10,
                                                      blurRadius: 1.0,
                                                  )
                                                ],
                                                    borderRadius: BorderRadius.circular(20), ),
                                                child: Row(
                                                  children: [
                                                     Padding(
                                                       padding: const EdgeInsets.only(left: 8),
                                                       child: SvgPicture.asset('assets/images/bed (1).svg'),
                                                     ),
                                                     Padding(
                                                      padding: const EdgeInsets.only(left: 8),
                                                       child: Text("Bed Light",style:kbedOptionscardTxtStyle),
                                                     )
                                                  ],
                                                )
                                              ),
                                   ],
                                 ),
                               ),
                             )
                           ),
                           
                     ],
                   ),
                  
                   Expanded(
                     child: Container(
                      width: 392.w,  
                       decoration: BoxDecoration(
                         color: Color.fromRGBO(239,246,250,5),
                           borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                         )
                       ),
                       child: SingleChildScrollView(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Padding(
                               padding: const EdgeInsets.only(left: 20,top: 20),
                               child: Text("Intensity",style: ksubHeading,),
                             ),
                             Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20,top: 20),
                                   child: Row(
                                     children: [
                                       SvgPicture.asset('assets/images/solution2.svg'),
                                     ],
                                   ),
                                 ),
                          Expanded(
                            child: Padding(
                             padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Slider(
                                    value: sliderValue,
                                    min: 1,
                                    max: 1000,
                                    activeColor: Colors.orange,
                                    inactiveColor: Colors.grey,
                                    onChanged: (double nvalue) {
                                      intensityChanger();
                                      setState(() {
                                        sliderValue = nvalue.roundToDouble();
                                      });
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 25,left: 25),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                       Container(
                                         height: 6,
                                         width: 1.5,
                                         color: Colors.grey,
                                       ),
                                        Container(
                                         height: 6,
                                         width: 1.5,
                                         color: Colors.grey,
                                       ),
                                        Container(
                                         height: 6,
                                         width: 1.5,
                                         color: Colors.grey,
                                       ), Container(
                                         height: 6,
                                         width: 1.5,
                                         color: Colors.grey,
                                       ), Container(
                                         height: 6,
                                         width: 1.5,
                                         color: Colors.grey,
                                       ), Container(
                                         height: 6,
                                         width: 1.5,
                                         color: Colors.grey,
                                       )
                                       
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                             Padding(
                                   padding: const EdgeInsets.only(right: 20,top: 20),
                                   child: Row(
                                     children: [
                                       SvgPicture.asset('assets/images/solution.svg'),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                                            
                          
                                            
                             Padding(
                               padding: const EdgeInsets.only(left: 20,top: 20),
                               child: Text("Colors",style: ksubHeading,),
                             ),
                             
                             Padding(
                              padding: const EdgeInsets.only(left: 20,top: 20),
                               child: Row(
                                 children: [
                                   FadeInLeft(
                                     child: InkWell(
                                       onTap: (){
                                       setBulbColors(255, 153, 153);
                                       },
                                       child: Container(
                                         height: 30.h,
                                         width: 30.w,
                                                                   decoration: BoxDecoration(
                                                                   color: Color.fromRGBO(255, 153, 153, 0.7),
                                        borderRadius: BorderRadius.all(Radius.circular(40))
                                                                   ),
                                                                 ),
                                     ),
                                   ),
                                 FadeInLeft(
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 12),
                                     child: InkWell(
                                       onTap: (){
                                         setBulbColors(153, 255, 153);
                                       },
                                       child: Container(
                                           height: 30.h,
                                           width: 30.w,
                                        decoration: BoxDecoration(
                                        color:  Color.fromRGBO(153, 255, 153, 0.6),
                                          borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                                               
                                                               ),
                                     ),
                                   ),
                                 ),
                                  FadeInLeft(
                                    child: Padding(
                                     padding: const EdgeInsets.only(left: 12),
                                     child:InkWell(
                                       onTap: (){
                                         setBulbColors(153, 255, 255);
                                       },
                                       child: Container(
                                           height: 30.h,
                                           width: 30.w,
                                        decoration: BoxDecoration(
                                        color: Color.fromRGBO(153, 255, 255, 0.7),
                                          borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                                                
                                                                     ),
                                     ),
                                   ),
                                  ),
                                  FadeInLeftBig(
                                    child: Padding(
                                     padding: const EdgeInsets.only(left: 12),
                                     child: InkWell(
                                       onTap: (){
                                         setBulbColors(185,102, 249,);
                                       },
                                       child: Container(
                                           height: 30.h,
                                           width: 30.w,
                                        decoration: BoxDecoration(
                                        color: Color.fromRGBO(185,102, 249, 0.7),
                                          borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                                                
                                    ),
                                     ),
                                     ),
                                  ),
                                  FadeInLeftBig(
                                    child: Padding(
                                     padding: const EdgeInsets.only(left: 12),
                                     child: InkWell(
                                       onTap: (){ 
                                         setBulbColors(178, 102, 255,);
                                         
                                       },
                                       child: Container(
                                           height: 30.h,
                                           width: 30.w,
                                        decoration: BoxDecoration(
                                        color: Color.fromRGBO(178, 102, 255, 0.5),
                                          borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                                                
                                                                ),
                                     ),
                                                               ),
                                  ),
                                  FadeInLeftBig(
                                    child: Padding(
                                     padding: const EdgeInsets.only(left: 12),
                                     child:InkWell(
                                       onTap: (){
                                         setBulbColors(255, 204, 153,);
                                       },
                                       child: Container(
                                           height: 30.h,
                                           width: 30.w,
                                        decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 204, 153, 0.6),
                                          borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                                                
                                                                ),
                                     ),
                                                               ),
                                  ),
                                  FadeInLeftBig(
                                    child: Padding(
                                     padding: const EdgeInsets.only(left: 20),
                                     child: SvgPicture.asset('assets/images/+.svg'),
                                                               ),
                                  )
                                                
                                 ],
                               ),
                             ),
                              Padding(
                               padding: const EdgeInsets.only(left: 20,top: 20),
                               child: Text("Scenes",style: ksubHeading,),
                             ), 
                                            
                             SizedBox(
                               height: 15.h,
                             ),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   FadeInLeft(
                                     child: Container(
                                                       height: 70.h,   
                                         width: 160.w,
                                        margin: const EdgeInsets.fromLTRB(20, 0, 15, 25),
                                                      decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                         begin: Alignment.topRight,
                                         end: Alignment.bottomLeft,
                                         colors: [
                                                      Color.fromRGBO(255, 153, 153, 0.7),
                                                       Color.fromRGBO(255, 153, 153, 5),
                                         ],
                                       ),
                                                       boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            color: Colors.white10,
                                                            blurRadius: 1.0,
                                                        )
                                                      ],
                                                          borderRadius: BorderRadius.circular(20), ),
                                                      child: Row(
                                                        children: [
                                                           Padding(
                                                             padding: const EdgeInsets.only(left: 15),
                                                             child: SvgPicture.asset('assets/images/surface2.svg'),
                                                           ),
                                                           Padding(
                                                            padding: const EdgeInsets.only(left: 15),
                                                             child: Text("Birthday",style:kbedOptionscardTxtStyle2),
                                                           )
                                                        ],
                                                      )
                                        ),
                                   ),
                                            
                                 FadeInLeftBig(
                                   child: Container(
                                                     height: 70.h,   
                                         width: 160.w,
                                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 25),
                                                    decoration: BoxDecoration(
                                                     //  color: Color.fromRGBO(246, 253, 255, 5),
                                                       gradient: LinearGradient(
                                         begin: Alignment.topRight,
                                         end: Alignment.bottomLeft,
                                         colors: [
                                                    Color.fromRGBO(178, 102, 255, 0.7),
                                                     Color.fromRGBO(178, 102, 255, 5),
                                         ],
                                       ),
                                                     boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                          color: Colors.white10,
                                                          blurRadius: 1.0,
                                                      )
                                                    ],
                                                        borderRadius: BorderRadius.circular(20), ),
                                                    child: Row(
                                                      children: [
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 15),
                                                           child: SvgPicture.asset('assets/images/surface2.svg'),
                                                         ),
                                                         Padding(
                                                          padding: const EdgeInsets.only(left: 15),
                                                           child: Text("Party",style:kbedOptionscardTxtStyle2),
                                                         )
                                                      ],
                                                    )       ),
                                 ),
                                ],
                              ),
                                            
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   FadeInLeft(
                                     child: Container(
                                                       height: 70.h,   
                                         width: 160.w,
                                        margin: const EdgeInsets.fromLTRB(20, 0, 15, 25),
                                                      decoration: BoxDecoration(
                                                       gradient: LinearGradient(
                                         begin: Alignment.topRight,
                                         end: Alignment.bottomLeft,
                                         colors: [
                                                      Color.fromRGBO(153, 255, 255, 0.7),
                                                       Color.fromRGBO(153, 255, 255, 5),
                                         ],
                                       ),
                                                       boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            color: Colors.white10,
                                                            blurRadius: 1.0,
                                                        )
                                                      ],
                                                          borderRadius: BorderRadius.circular(20), ),
                                                      child: Row(
                                                        children: [
                                                           Padding(
                                                             padding: const EdgeInsets.only(left: 15),
                                                             child: SvgPicture.asset('assets/images/surface2.svg'),
                                                           ),
                                                           Padding(
                                                            padding: const EdgeInsets.only(left: 15),
                                                             child: Text("Relax",style:kbedOptionscardTxtStyle2),
                                                           )
                                                        ],
                                                      )
                                        ),
                                   ),
                                 FadeInLeftBig(
                                   child: Container(
                                                     height: 70.h,   
                                         width: 160.w,
                                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 25),
                                                    decoration: BoxDecoration(
                                                     //  color: Color.fromRGBO(153, 255, 153,5, 5),
                                                      gradient: LinearGradient(
                                         begin: Alignment.topRight,
                                         end: Alignment.bottomLeft,
                                         colors: [
                                                    Color.fromRGBO(102, 249, 132, 0.7),
                                                     Color.fromRGBO(102, 249, 132, 5),
                                         ],
                                       ),
                                                     boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                          color: Colors.white10,
                                                          blurRadius: 1.0,
                                                      )
                                                    ],
                                                        borderRadius: BorderRadius.circular(20), ),
                                                    child: Row(
                                                      children: [
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 15),
                                                           child: SvgPicture.asset('assets/images/surface2.svg'),
                                                         ),
                                                         Padding(
                                                          padding: const EdgeInsets.only(left: 15),
                                                           child: Text("Fun",style:kbedOptionscardTxtStyle2),
                                                         )
                                                      ],
                                                    )
                                        ),
                                 ),
                                ],
                              )
                            
                           ],
                         ),
                       ),
                     )
                   ),
                 ],
               ),
                Positioned(
                        right: 18,
                         top: 265,
                        child: InkWell(
                          onTap: (){
                            if( oppacity == 0.1){

                            setState(() { 
                            oppacity = 0.6;
                              });
                            }else{
                               setState(() { 
                            oppacity = 0.1;
                              });
                            }
                          },
                          child: Container(
                                   height: 30.h,
                                   width: 30.w,
                                decoration: BoxDecoration(
                                   boxShadow: <BoxShadow>[
                                               BoxShadow(
                             color: Colors.black38
                             ,
                             blurRadius: 8.0,
                                               )
                                             ],
                                              color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(40))
                                ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SvgPicture.asset('assets/images/Icon awesome-power-off.svg'),
                              ),
                              ),
                        ),
                      ),
             ],
           ),
         ),
         bottomNavigationBar: Container(
           height: 70.h,
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