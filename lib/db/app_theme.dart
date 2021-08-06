import 'package:flutter/cupertino.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_demo/db/db.dart';

class MyAppTheme extends ChangeNotifier {
  MyAppTheme._internal();
  static final MyAppTheme _instance = MyAppTheme._internal();

  static MyAppTheme get instance => _instance;

  final StoreRef _store = StoreRef.main();
  final Database _db = DB.instance.database;

  bool _darkEnabled = false;

  bool get darkEnabled => _darkEnabled;

  Future<void> init() async {
    _darkEnabled = (await _store.record('DARK_ENABLED').get(_db)) ?? false;
  }

  change(bool darkEnabled) async {
    _darkEnabled = darkEnabled;
    final dataSaved = await _store.record('DARK_ENABLED').put(_db, darkEnabled);
    print(dataSaved);
    notifyListeners();
  }
}
