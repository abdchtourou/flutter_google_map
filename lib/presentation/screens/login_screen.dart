import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_maps/business_logic/cubit/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:flutter_google_maps/constant/extensions.dart';
import 'package:flutter_google_maps/helpers/routes/routes.dart';

import '../widgets/next_button.dart';
import '../widgets/phone_filed.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  bool isPhoneValid = false; // State variable for phone validation

  void validatePhone(bool isValid) {
    setState(() {
      isPhoneValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0E151B),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 88),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIntroTexts(),
                PhoneFiled(
                  phoneController: controller,
                  onPhoneValidation:
                  validatePhone, // Pass the validation callback
                ),
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NextButton(
                    onPressed: () {
                      if (isPhoneValid) {
                        context.pushReplacementNamed(
                            Routes.resetPasswordVerification);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter a valid phone number.'),
                          ),
                        );
                      }
                    },
                  ),
                ),
                _buildPhoneNubmerSubmitedBloc()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
void showDialogLoading(BuildContext context){
  AlertDialog alertDialog =const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(),
    ),
  );
  showDialog(
    barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,

      context: context, builder: (_){
    return alertDialog;

  });
}

Widget _buildPhoneNubmerSubmitedBloc() {
  return BlocListener<PhoneAuthCubit,PhoneAuthState>(listenWhen: (prev, current) {
    return prev != current;
  },
  listener: (context,state){

    if(state is PhoneAuthLoading){
      showDialogLoading(context);
    }
      if(state is PhoneAuthPhoneNumberSubmit){
        context.pop();
        context.pushReplacementNamed(Routes.resetPasswordVerification);
      }
  },
  );
}

Widget _buildIntroTexts() {
  return Column(
    children: [
      const Text(
        "What is your Phone Number",
        style: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 30,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        child: const Text(
          "Please enter your phone number to verify your account",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      const SizedBox(
        height: 100,
      ),
    ],
  );
}
