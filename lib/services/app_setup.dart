import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:my_simple_messanger/firebase_options.dart';

class AppSetup{
  static Future<void>get setup async{
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
  }
}