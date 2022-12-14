import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/styles.dart';
import '../../cubits/chat/chat_cubit.dart';

class CreateChat extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  CreateChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.mainColor,
        elevation: 0,
        title: const Text('Create chat'),
      ),
      body: Column(
        children: [
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return const Text('');
            },
          ),
          Container(
            padding: const EdgeInsets.all(45),
            child: Container(
              height: 270,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: Styles.inputBorder,
                              focusedBorder: Styles.focusBorder,
                              hintText: 'Name',
                            ),
                            controller: _nameController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 40, left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<ChatCubit>()
                                    .create(_nameController.text);
                              },
                              style: Styles.buttonFilledStyles,
                              child: const Text('Create')),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
