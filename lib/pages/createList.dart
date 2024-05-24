import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingilizcekelime/db/db/DB.dart';
import 'package:ingilizcekelime/db/models/lists.dart';
import 'package:ingilizcekelime/db/models/words.dart';
import 'package:ingilizcekelime/global_widgets/appBar.dart';


class CreateList extends StatefulWidget {
  const CreateList({super.key});

  @override
  State<CreateList> createState() => _CreateListState();
}


class _CreateListState extends State<CreateList> {
  final _listName=TextEditingController();

  late List<TextEditingController> wordTextEditingList=[];
  List<Row> wordListField=[];

  void initState() {
    super.initState();

    for (var i = 0; i < 10; i++)
      wordTextEditingList.add(TextEditingController());

    for (var i = 0; i < 5; i++) {
      wordListField.add(
          Row(
            children: [
              Expanded(child: textFieldBuilder(
                  textEditingController: wordTextEditingList[2 * i])),
              Expanded(child: textFieldBuilder(
                  textEditingController: wordTextEditingList[2 * i + 1])),
            ],
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final screenwidht = screen.size.width;
    final screenheight = screen.size.height;








    return Scaffold(
      appBar: appbar(context,

          left: IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed:()=> Navigator.pop(context),
          ),
          center: Image.asset("assets/images/logo_text.png"),
          right: Image.asset("assets/images/logo.png")),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[
        Container(
        width: screenwidht/1.15,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(screenwidht/50)
          ),
          margin: EdgeInsets.only(right: screenwidht/20,left: screenwidht/20,top: 10),
          child: TextField(
            maxLines: 1,
            keyboardType: TextInputType.name,
            controller: _listName,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Robotomedium",
              fontSize: 18,
            ),

            decoration: InputDecoration(
              icon: Icon(Icons.list),
              hintText: "Liste Adı",
              border: InputBorder.none,
            ),
          ),
        ),
           Container(
             margin: EdgeInsets.only(top: 20),
             child: Row (

               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Text("İngilizce",style: TextStyle(fontSize: 20,fontFamily: "Robotoregular"),),
                 Text("Türkçe",style: TextStyle(fontSize: 20,fontFamily: "Robotomedium"),),
               ],
             ),
           ),
            Expanded(
              child:SingleChildScrollView(
              child: Column(
                children: wordListField,
              ),
            ),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: screenheight/50,top: 5),
              child: Container(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      IconButton(icon:Icon(Icons.add_circle,size: 45,),
                        onPressed: (){
                        wordTextEditingList.add(TextEditingController());
                        wordTextEditingList.add(TextEditingController());

                        wordListField.add(
                          Row(
                            children: [
                              Expanded(child: textFieldBuilder(textEditingController:
                              wordTextEditingList[wordTextEditingList.length-2])),
                              Expanded(child: textFieldBuilder(textEditingController:
                              wordTextEditingList[wordTextEditingList.length-1])),
                            ],
                          )
                        );
                        setState(()=>wordListField);

                        },),
                      SizedBox(width: screenwidht/10,),

                      IconButton(icon: Icon(Icons.save,size: 39,),
                        onPressed: () async {

                        int counter=0;
                        bool notEmptyPair=false;

                        for(var i=0;i<wordTextEditingList.length/2;i++){

                          String eng=wordTextEditingList[2*i].text;
                          String tr=wordTextEditingList[2*i+1].text;

                          if(!eng.isEmpty && !tr.isEmpty){
                            counter++;
                          }else{
                            notEmptyPair=true;
                          }
                        }

                        if(counter>=1){
                          if(notEmptyPair==false){
                            Lists addList= await DB.instance.insertList(Lists(name: _listName.text));

                            for(int i=0;i<wordTextEditingList.length/2;i++){

                              String eng=wordTextEditingList[2*i].text;
                              String tr=wordTextEditingList[2*i+1].text;

                           //  Word word= await DB.instance.insertWord(Word(list_id: addList.id,word_eng:eng ,word_tr:tr ,status: false) );

                             // debugPrint(word.id.toString()+"  "+word.list_id.toString()+"  "+word.word_eng.toString()+"  "+
                             // word.word_tr.toString()+"  "+word.status.toString() );
                            }
                            debugPrint("TOAST MESSAGE => Liste Oluşturuldu. ");
                            _listName.clear();
                            wordTextEditingList.forEach((element) {
                              element.clear();
                            });
                          }else{
                            debugPrint("TOAST MESSAGE => Boş Alanları Silin veya Doldurun. ");
                          }
                        }else{
                          debugPrint("TOAST MESSAGE => Minimum 4 çift dolu olmalıdır. ");

                        }






                        },
                      ),
                      SizedBox(width: screenwidht/10,),

                      IconButton(icon:Icon(Icons.remove_circle,size: 45,),
                        onPressed: (){
                         wordTextEditingList.removeAt(wordTextEditingList.length - 1);
                         wordTextEditingList.removeAt(wordTextEditingList.length - 1);

                         wordListField.removeAt(wordListField.length-1);

                          setState(()=>wordListField);

                        },),

                    ],
                  ),
                ),
              ),
            ),


      ],
      ),

            ),
    );

  }

  Container textFieldBuilder(


  {
      required TextEditingController ?textEditingController}) {
    return Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5)
              ),
              margin: EdgeInsets.only(right: 10,left: 10,top: 10),
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.name,
                controller: textEditingController,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Robotomedium",
                  fontSize: 15,
                ),

                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            );
  }

  }

