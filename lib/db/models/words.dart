import 'package:flutter/widgets.dart';

final String tableNameWords ="word";

class WordTableField {

  static final List<String> values = [id,list_id,word_eng,word_tr,status];



  static final String id="id";
  static final String list_id="lists_id";
  static final String word_eng="word_eng";
  static final String word_tr="word_tr";
  static final String status="status";


}

class Word{

  late final int? id;
  late final int? list_id;
  late final String? word_eng;
  late final String? word_tr;
  late final bool? status;

  Word({this.id, this.list_id, this.word_eng, this.word_tr, this.status});

  Word Copy({int? id,int ?list_id, String? word_eng,String ?word_tr,bool? status}){
    return Word(
        id: id?? this.id,
        list_id: list_id?? this.list_id,
        word_eng: word_eng?? this.word_eng,
        word_tr: word_tr?? this.word_tr,
        status: status?? this.status);
}


Map<String,Object?> toJson()=> {

    WordTableField.id: id,
  WordTableField.list_id: list_id,
  WordTableField.word_eng: word_eng,
  WordTableField.word_tr: word_tr,
  WordTableField.status: status == true ? 1:0,

};
  static Word fromJson(Map<String, Object?>json ) => Word(
    id: json[WordTableField.id] as int?,
    list_id: json[WordTableField.list_id] as int?,
    word_eng: json[WordTableField.word_eng] as String?,
    word_tr: json[WordTableField.word_tr] as String?,
    status: json[WordTableField.status]==1,



  );
}