import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: UniqueKey(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 88),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_buildIntroTexts()],
              ),
            )),
      ),
    );
  }
}

Widget _buildIntroTexts() {
  return Column(
    children: [
      const Text(
        "What is your Phone Number ",
        style: TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 30,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        child: const Text(
          "Please enter your phone number to verify your account ",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      )
    ],
  );
}

Widget _buildPhoneField() {
  var _phoneController;
  return IntlPhoneField(
    controller: _phoneController,
    decoration: const InputDecoration(
      labelText: 'Phone Number',
      border: OutlineInputBorder(),
    ),
    initialCountryCode: 'SY',
    style: const TextStyle(color: Colors.white),
    dropdownTextStyle: const TextStyle(color: Colors.white),
    dropdownIcon: const Icon(
      Icons.arrow_drop_down,
      color: Colors.white,
    ),
    onChanged: (phone) {
      print(phone.completeNumber);
    },
  );
}
