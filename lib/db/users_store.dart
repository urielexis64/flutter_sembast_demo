import 'package:sembast/sembast.dart';
import 'package:sembast_demo/db/db.dart';
import 'package:sembast_demo/modesl/user.dart';

class UsersStore {
  UsersStore._internal();
  static UsersStore _instance = UsersStore._internal();

  static UsersStore get instance => _instance;

  final Database _db = DB.instance.database;
  final StoreRef<String, Map> _storeRef = StoreRef<String, Map>('users');

  Future<void> add(User user) async {
    await _storeRef.record(user.id).put(_db, user.toJson());
  }

  Future<int> removeAll() async => await _storeRef.delete(_db);

  Future<int> removeById(String id) async =>
      await _storeRef.delete(_db, finder: Finder(filter: Filter.byKey(id)));

  Future<List<User>> find(Finder finder) async {
    List<RecordSnapshot<String, Map>> snapshots =
        await _storeRef.find(_db, finder: finder);

    return snapshots
        .map((RecordSnapshot<String, Map> snap) => User.fromJson(snap.value))
        .toList();
  }
}
