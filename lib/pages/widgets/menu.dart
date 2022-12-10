import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/chat/chat_cubit.dart';
import '../../cubits/user/user_cubit.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return UserAccountsDrawerHeader(
                accountName: Text('${state.user?.name}'),
                accountEmail: Text('${state.user?.email}'),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Create chat'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/create-chat'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('asfdasdf'),
            // onTap: () => null,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ChatCubit>().getList();
              },
              child: const Text('get chats'))
        ],
      ),
    );
  }
}
