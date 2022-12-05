import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/chat/chat_cubit.dart';
import '../cubits/user/user_cubit.dart';
import 'widgets/menu.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: Menu(),
      body: Column(
        children: [
          const Text('Dashboard page'),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserStateLoaded) {
                return Text('a userStat - ${state.user?.email}');
              }
              if (state is UserStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Text('error');
            },
          ),


          ElevatedButton(onPressed: () {
            context.read<UserCubit>().getCurrentUser();
          }, child: const Text('get user')),


          const Text('Chats'),
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              if (state is ChatStateLoaded) {

                return Text('a userStat - ${state}');
              }
              if (state is ChatStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Text('error');
            },
          ),

          ElevatedButton(onPressed: () {
            context.read<ChatCubit>().getChatsByCurrentUser();
          }, child: const Text('get chats'))
        ],
      ),
    );
  }
}
