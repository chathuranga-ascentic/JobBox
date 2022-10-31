import 'package:flutter/widgets.dart';
import 'package:job_box/blocs/app/app_bloc.dart';

import 'package:job_box/screens/home/home_screen.dart';
import 'package:job_box/screens/auth/login_screen.dart';

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}