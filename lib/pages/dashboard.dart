import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../configs/styles.dart';
import '../cubits/chat/chat_cubit.dart';
import 'widgets/menu.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (controller.offset >= controller.position.maxScrollExtent &&
          !controller.position.outOfRange) {
        context.read<ChatCubit>().getList();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Styles.mainColor,
        elevation: 0,
      ),
      drawer: const Menu(),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state is ChatStateLoaded && state.chats?.length != null) {
            return ListView.builder(
              itemCount: state.chats?.length,
              shrinkWrap: true,
              controller: controller,
              itemBuilder: (context, index) {
                return Slidable(
                  key: const ValueKey(0),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),
                    children: [
                      SlidableAction(
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                        onPressed: (BuildContext context) {},
                      ),
                      SlidableAction(
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.share,
                        label: 'Edit',
                        onPressed: (BuildContext context) {},
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(state.chats![index].name),
                  ),
                );
              },
            );
          }
          if (state is ChatStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ElevatedButton(
              onPressed: () {
                context.read<ChatCubit>().getList();
              },
              child: const Text('get chats'));
        },
      ),
    );
  }
}
