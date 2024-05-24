import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingilizcekelime/global_widgets/appBar.dart';
import 'package:ingilizcekelime/pages/createList.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final screenwidht = screen.size.width;
    final screenheight = screen.size.height;
    return Scaffold(
      appBar: appbar(context,
          left:IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(CupertinoIcons.back,size: 30,),color: Colors.black,),
          leftButton: ()=>Navigator.pop(context),
          center: Image.asset("assets/images/logo_text.png"),
        right: Image.asset("assets/images/logo.png"),
      ),
        floatingActionButton: FloatingActionButton(

          tooltip: 'ADD WORD LIST',
          onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateList()));
          },
          child: Icon(Icons.add,size: screenheight/30,),
          backgroundColor: Colors.purple.withGreen(3),
        ),
      body: Center(

        child: Column(

          children: [

            SizedBox(
              width: screenwidht,
              height: screenheight/9,
              child: Card(
                color: Colors.purple.shade200,
                elevation: 10,
                margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                              children:  const [


                      Padding(
                        padding: EdgeInsets.only(left: 8.0,top: 5),
                        child: Text("Liste Adı",style: TextStyle(
                            fontWeight: FontWeight.w900,fontSize:20,fontFamily: "Robotomedium"),),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left:20.0),
                        child: Text("365 kelime var",style: TextStyle(fontFamily: "Robotoregular"),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:20.0,bottom: 5),
                        child: Text("5 kelime öğrenildi",style: TextStyle(fontFamily: "Robotoregular")),
                      ),

                      ],
                      ),

                ),
            ),

          ],
        ),
      ),


    );
  }
}
