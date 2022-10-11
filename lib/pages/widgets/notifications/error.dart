import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorNotification extends StatelessWidget {
  final String errorMessage;

  const ErrorNotification({Key? key, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          const Text(
            'Oops!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
    // return SnackBar(
    //   behavior: SnackBarBehavior.floating,
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     content: Container(
    //       height: 90,
    //   padding: const EdgeInsets.all(15),
    //   decoration: const BoxDecoration(
    //       color: Colors.red,
    //       borderRadius: BorderRadius.all(Radius.circular(20))),
    //   child: Column(
    //     children: [
    //       const Text(
    //         'Oops!',
    //         style: TextStyle(color: Colors.white, fontSize: 20),
    //       ),
    //       Text(
    //         errorMessage,
    //         style: const TextStyle(
    //           color: Colors.white,
    //         ),
    //       ),
    //     ],
    //   ),
    // ));
  }
}
