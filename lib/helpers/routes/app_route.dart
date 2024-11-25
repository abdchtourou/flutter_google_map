import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_maps/business_logic/cubit/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:flutter_google_maps/helpers/routes/routes.dart';
import 'package:flutter_google_maps/presentation/screens/login_screen.dart';
import 'package:flutter_google_maps/presentation/screens/map_screen.dart';
import 'package:flutter_google_maps/presentation/screens/otp_screen.dart';

import '../../presentation/widgets/verify_code_screen.dart';

class AppRoute {
  PhoneAuthCubit? phoneAuthCubit;

  AppRoute() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
        );
      case Routes.OtpScreen:
        final phoneNumber = setting.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
      case Routes.mapScreen:
        return MaterialPageRoute(builder: (_) => MapScreen());
    }
    return null;
  }
}
