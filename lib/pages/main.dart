import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingilizcekelime/global_widgets/appBar.dart';
import 'package:ingilizcekelime/pages/lists.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

enum Lang { tr, en, de }

class _MainPageState extends State<MainPage> {
  Lang? _chooseLang = Lang.tr;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final screenwidht = screen.size.width;
    final screenheight = screen.size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        color: Colors.white,
        width: screenwidht / 1.8,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Image.asset("assets/images/logo.png"),
            ),
            Text(
              "Quezzy",
              style: TextStyle(
                  fontFamily: "Robotolight",
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                "İstediğini öğren",
                style: TextStyle(fontFamily: "Robotolight", fontSize: 16),
              ),
            ),
            SizedBox(
              width: screenwidht / 3,
              child: Divider(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: screenheight / 9,
            ),
            Text(
              "Kullanımda zorluk yaşıyorsan",
              style: TextStyle(
                  fontFamily: "Robotolight",
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Buraya Tıkla",
                  style: TextStyle(color: Colors.blue),
                )),
            Spacer(),
            Text(
              "v0.9\nenesmrt@gmail.com",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      appBar: appbar(
        context,
        left: IconButton(
          onPressed: () { _scaffoldKey.currentState!.openDrawer(); },
            icon:  Icon(Icons.drag_handle,size: 30,),
        ),

        center: SizedBox(
            child: Image.asset("assets/images/logo_text.png",)),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenheight / 30),
              langRadio(screenwidht,
                  text: "İngilizce-Türkçe",
                  language: Lang.tr,
                  group: _chooseLang),
              langRadio(screenwidht,
                  text: "Türkçe-İngilizce",
                  language: Lang.en,
                  group: _chooseLang),
              SizedBox(
                height: screenheight / 25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListsPage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: screenheight / 20),
                  height: screenheight / 14,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          stops: [
                            0.1,
                            0.9
                          ],
                          colors: [
                            Colors.deepPurple.withOpacity(1.0),
                            Colors.purple.withOpacity(1)
                          ])),
                  child: Text("Listelerim",
                      style: TextStyle(
                          fontSize: screenwidht / 11.5,
                          fontFamily: "Carter",
                          color: Colors.white)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  children: [
                    card(screenwidht, screenheight,
                        text: " Kelime Kartları",
                        icons: Icons.file_copy_outlined),
                    Spacer(),
                    card(screenwidht, screenheight,
                        text: "Çoktan Seçmeli",
                        icons: CupertinoIcons.check_mark_circled),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container card(
    double screenwidht,
    double screenheight, {
    required String? text,
    required IconData? icons,
  }) {
    return Container(
      alignment: Alignment.center,
      height: screenwidht * 1.8 / 3,
      width: screenwidht / 3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
            0.1,
            .9,
          ], colors: [
            Colors.deepPurple.withOpacity(1.0),
            Colors.purple.withOpacity(1)
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text!,
              style: TextStyle(
                  fontSize: screenwidht / 13,
                  fontFamily: "Carter",
                  color: Colors.white),
              textAlign: TextAlign.center),
          Container(
            height: screenheight / 50,
          ),
          Icon(
            icons! as IconData?,
            size: screenheight / 15,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  SizedBox langRadio(
    double screenwidht, {
    required String? text,
    required Lang? language,
    required Lang? group,
  }) {
    return SizedBox(
      height: screenwidht / 10,
      width: screenwidht / 1.3,
      child: ListTile(
        title: Text(
          text!,
          style: TextStyle(
              fontFamily: "Carter",
              fontSize: screenwidht / 20,
              fontWeight: FontWeight.w900),
        ),
        leading: Radio<Lang>(
          value: language!,
          groupValue: _chooseLang,
          onChanged: (Lang? value) {
            setState(() {
              _chooseLang = value;
            });
          },
        ),
      ),
    );
  }
}
