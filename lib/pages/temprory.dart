import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ingilizcekelime/main.dart';
import 'package:ingilizcekelime/pages/main.dart';

class TemproryPage extends StatefulWidget {

  @override
  State<TemproryPage> createState() => _TemproryPageState();
}


class _TemproryPageState extends State<TemproryPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: (2)),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage() ));

    });
  }

  // String t="Hadi Öğrenelim";
  // String ttr = "Hadi Öğrenelim";
  // String ten = "Lets Learn";
  // int x=0;


  // void buttonClicked() {
  //   setState(() {
  //     x+=1;
  //     if(x%2==0){
  //       t="Hadi Öğrenelim";
  //     }if(x%2==1){
  //       t=="Lets Learn";
  //     }
  //   });
  //   print("değişti");
  // }


  // bool control=true;



    @override
    Widget build(BuildContext context) {

      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
                children: [
                  Image.asset("assets/images/logo.png"),
                  Text("QUEAZY",
                    style: TextStyle(fontSize: 40, fontFamily: "Luck"),),
                  Container(height: 450,),



                  // TextButton(
                  //   onPressed: (){
                  //     control=false;
                  //
                  //   },
                  //
                  //   child: Text(control ? "${ttr}":"${ten}", style:
                  //   TextStyle(fontSize: 35, fontFamily: "Carter"),),
                  //
                  //
                  // ),
                  Text("Hadi Öğrenelim", style:
            TextStyle(fontSize: 35, fontFamily: "Carter"),),


            ]
            ),
          ),
        ),
      );
    }
  }





