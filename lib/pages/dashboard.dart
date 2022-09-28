import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/user/user_cubit.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          const Text('Dashboard page'),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              print(state.user?.email);
              return Text('userStat - ${state.user?.email}');
            },
          ),

          ElevatedButton(onPressed: () {
            context.read<UserCubit>().getCurrentUser();
          }, child: const Text('touch me:)'))
        ],
      ),
    );
  }
}
