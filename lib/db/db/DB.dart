
import 'package:ingilizcekelime/db/models/lists.dart';
import 'package:ingilizcekelime/db/models/words.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DB{

  static final DB instance= DB._init();
  static Database? _database;

  DB._init();

  Future<Database> get database async{
    if(_database!=null) return _database!;

    _database = await _initDB('quezy.db');
    return _database!;
  }
  Future<Database> _initDB(String filePath) async{
    final path=join(await getDatabasesPath(),filePath);
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }
  Future _createDB(Database db,int version) async{
     final idType='INTEGER PRİMARY KEY AUTOINCREMENT';
    final boolType='BOOLEAN NOT NULL';
    final integerType='INTEGER NOT NULL';
    final textType='TEXT NOT NULL';


    await db.execute('''
    CREATE TABLE IF NOT EXISTS
    $tablenamelists(
    ${ListsTableField.id} $idType,
    ${ListsTableField.name} $textType,
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS KelimeTablosu(
        ${WordTableField.id} $idType,
        ${WordTableField.list_id} $integerType,
        ${WordTableField.word_eng} $textType,
        ${WordTableField.word_tr} $textType,
        ${WordTableField.status} $boolType,
      FOREİGN KEY(${WordTableField.list_id}) REFERENCES $tablenamelists (${ListsTableField.id})
      )
    ''');
  }
  Future<Lists> insertList(Lists lists) async{
    final db =await instance.database;
    final id =await db.insert(tablenamelists,lists.toJson());

    return lists.Copy(id: id);
  }
  Future<Word> insertWord(Word word) async{
    final db =await instance.database;
    final id =await db.insert(tableNameWords,word.toJson());
    return word.Copy(id: id);
  }

  Future<List<Word>> readWordByList(int ?listID) async{

    final db =await instance.database;
    final orderBy=  '${WordTableField.id} ASC ';
    final result=await db.query(tableNameWords,
        orderBy: orderBy,where: '${WordTableField.list_id}=?',
    whereArgs: [listID]);

    return result.map((json) => Word.fromJson(json)).toList();
    }
  Future<List<Lists>> readListAll() async{

    final db =await instance.database;
    final orderBy=  '${ListsTableField.id} ASC ';
    final result=await db.query(tableNameWords,orderBy: orderBy);

    return result.map((json) => Lists.fromJson(json)).toList();
  }


  Future<int> updateWord(Word word) async{
    final db =await instance.database;
    return db.update(tableNameWords, word.toJson(),where: '${WordTableField.id}=?',
       whereArgs: [word.id]);
  }
  Future<int> updateList(Lists lists) async{
    final db =await instance.database;
    return db.update(tablenamelists, lists.toJson(),where: '${ListsTableField.id}=?',
        whereArgs: [lists.id]);
  }
  Future<int> deleteWord(int id) async{
    final db =await instance.database;
    return db.delete(tableNameWords, where: '${WordTableField.id}=?',
        whereArgs: [id]);
  }

  Future<int> deleteListsAndWordByList(int id) async{
    final db =await instance.database;


    int result= await db.delete(tablenamelists,where: '${ListsTableField.id}=?',
    whereArgs: [id]);
    if(result==1){
      await db.delete(tableNameWords,where: '${WordTableField.list_id}=?',
          whereArgs: [id]);
    }

    return result;
  }

  Future close() async{
    final db =await instance.database;
    db.close();

  }











}