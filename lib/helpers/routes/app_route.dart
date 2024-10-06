import 'package:flutter/material.dart';
import 'package:flutter_google_maps/helpers/routes/routes.dart';
import 'package:flutter_google_maps/presentation/screens/login_screen.dart';

class AppRoute {
  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
    return null;
  }
}
