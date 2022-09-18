import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'configs/firebase_constants.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: FirebaseConstants.apiKey,
        appId: FirebaseConstants.appId,
        messagingSenderId: FirebaseConstants.messagingSenderId,
        projectId: FirebaseConstants.projectId,
      ),
    );
  }

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes(context).getRoutes(),
    );
  }
}
