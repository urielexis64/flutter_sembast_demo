import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_demo/db/app_theme.dart';
import 'package:sembast_demo/db/users_store.dart';
import 'package:sembast_demo/helpers/helpers.dart';
import 'package:sembast_demo/modesl/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  _load() async {
    Finder finder = Finder(sortOrders: [SortOrder('name'), SortOrder('age')]);
    users = await UsersStore.instance.find(finder);
    setState(() {});
  }

  _add() async {
    final user = User.fake();
    await UsersStore.instance.add(user);
    users.add(user);
    setState(() {});
  }

  _removeAll() async {
    Helpers.showYesNoDialog(context, 'Remove all', 'Are you sure?', () async {
      final removeCount = await UsersStore.instance.removeAll();
      users.clear();
      setState(() {});
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$removeCount items were removed.')));
    });
  }

  _removeById(id) async {
    Helpers.showYesNoDialog(context, 'Remove user', 'Are you sure?', () async {
      await UsersStore.instance.removeById(id);
      users.removeWhere((user) => user.id == id);
      setState(() {});
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('User removed successfully.')));
    });
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: MyAppTheme.instance.darkEnabled,
              onChanged: (enabled) {
                MyAppTheme.instance.change(enabled);
              })
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (_, i) {
          final user = users[i];
          return ListTile(
            onLongPress: () => _removeById(user.id),
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Text('${user.age}'),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _load,
            heroTag: 'reload',
            tooltip: 'Sort by name',
            child: Icon(
              Icons.sort,
              color: Colors.white,
            ),
            backgroundColor: Colors.lightGreen,
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: _removeAll,
            tooltip: 'Clear all users',
            heroTag: 'clear',
            child: Icon(
              Icons.clear_all,
              color: Colors.white,
            ),
            backgroundColor: Colors.redAccent,
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            tooltip: 'Add user',
            onPressed: _add,
            heroTag: 'add',
            child: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
