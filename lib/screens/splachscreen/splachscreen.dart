import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mokata3a/screens/mainscreen/mainscreen.dart';

import 'package:page_transition/page_transition.dart';


import '../../constant/style.dart';
import '../../widgets/DefaultTextStyle/defaultextstyle.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  @override

  void initState() {
 
    // TODO: implement initState
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              duration: const Duration(
                milliseconds: 300,
              ),
              type: PageTransitionType.leftToRight,
              child:const MainScreen()
                  ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: maincolor,
      extendBody: true,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height * 0.04),
                    height: height * 0.03,
                    width: width * 0.03,
                    decoration:
                        BoxDecoration(color: white, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: MyDefaultTextStyle(
                        text: "مقاطعة", height: height * 0.06, bold: true),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.38,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'made by',
                    style: TextStyle(
                        color: white,
                        fontSize: height * 0.018,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: height * 0.009,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Aymen Academy',
                    style: TextStyle(
                        color: white,
                        fontSize: height * 0.019,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ))
            ]),
      ),
    );
  }
}
