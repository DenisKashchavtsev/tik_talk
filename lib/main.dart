import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'configs/firebase_constants.dart';
import 'routes.dart';
import 'services/navigation_service.dart';

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
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.blue
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.blue
    ..textColor = Colors.blue
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigationKey,
      routes: Routes(context).getRoutes(),
      builder: EasyLoading.init(),
    );
  }
}
