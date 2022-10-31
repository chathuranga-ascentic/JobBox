import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_box/repositories/auth_repository.dart';

import '../bloc_observer.dart';
import '../main.dart';

class FlutterAppConfig {
  Future run() async {
    await runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      Bloc.observer = AppBlocObserver();
      final authRepository = AuthRepository();
      runApp(App(authRepository: authRepository));
    }, (error, stackTrace) {
      debugPrint(error.toString());
    });
  }
}
