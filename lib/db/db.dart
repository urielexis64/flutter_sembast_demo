import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DB {
  DB._internal();
  static DB _instance = DB._internal();
  static DB get instance => _instance;

  late Database _database;

  Future<void> init() async {
    final String dbName = 'flutter_sembast.db';

    final String dir = (await getApplicationDocumentsDirectory()).path;

    final String path = join(dir, dbName);

    _database = await databaseFactoryIo.openDatabase(path);
  }

  Future<void> close() async {
    await _database.close();
  }
}
