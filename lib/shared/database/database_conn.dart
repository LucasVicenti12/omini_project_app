import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), "dev_app.db");

  return openDatabase(
    path,
    onCreate: (db, _){
      db.execute("");
    },
    version: 1,
  );
}