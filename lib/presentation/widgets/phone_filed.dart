import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneFiled extends StatelessWidget {
  PhoneFiled({super.key, required this.phoneController, required this.onPhoneValidation});
  final TextEditingController phoneController;
  final Function(bool) onPhoneValidation; // Validation callback

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: phoneController,
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
        bool isValid = phone.completeNumber.isNotEmpty;
        onPhoneValidation(isValid);
      },
    );
  }
}
