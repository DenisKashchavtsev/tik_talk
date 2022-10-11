import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
              accountName: Text('test'),
              accountEmail: Text('accountEmail'),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            // onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Friends'),
            // onTap: () => null,
          ),
        ],
      ),
    );
  }
}
