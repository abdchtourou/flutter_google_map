import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
   PinCodeField({super.key, required this.onChanged});
  void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.w),
        fieldHeight: 45.h,
        fieldWidth: 45.w,
        activeFillColor: Colors.grey.withOpacity(0.3),
        inactiveFillColor: const Color(0xFF2A2A2A),
        selectedFillColor: Colors.grey.withOpacity(0.3),
        inactiveColor: Colors.grey,
        selectedColor: Colors.white,
        activeColor: Colors.grey,
      ),
      cursorColor: Colors.white,
      textStyle: TextStyle(color: Colors.white),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onChanged: (value) {
        print(value);
      },
    );
  }
}
