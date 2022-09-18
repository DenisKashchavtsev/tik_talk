import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: const [
          Text('Dashboard page'),
        ],
      ),
    );
  }
}
