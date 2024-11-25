// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_google_maps/constant/extensions.dart';
// import 'package:flutter_google_maps/presentation/widgets/next_button.dart';
// import 'package:flutter_google_maps/presentation/widgets/pin_code_field.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// import '../../business_logic/cubit/phone_auth_cubit/phone_auth_cubit.dart';
// import '../../helpers/routes/routes.dart';
// import '../screens/login_screen.dart';
//
// class ResetPasswordVerification extends StatelessWidget {
//    ResetPasswordVerification({super.key, required this.phoneNumber});
//    final String phoneNumber;
//    late String otpCode;a
//
//   @override
//   Widget build(BuildContext context) {
//     Widget _buildPhoneVerificationBLoc(){
//       return BlocListener<PhoneAuthCubit, PhoneAuthState>(
//         listenWhen: (prev, current) {
//           return prev != current;
//         },
//         listener: (context, state) {
//           if (state is PhoneAuthLoading) {
//             showDialogLoading(context);
//           }
//           if (state is PhoneAuthPhoneOTPVerify) {
//             context.pop();
//             context.pushReplacementNamed(Routes.mapScreen);
//           }
//           if (state is PhoneAuthErrorOccurred) {
//             context.pop();
//             String errMsg = state.errorMsg;
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(errMsg),
//               backgroundColor: Colors.black,
//               duration: Duration(seconds: 3),
//             ));
//           }
//         },
//         child: Container(),
//       );
//     }
//     return Scaffold(
//       backgroundColor: const Color(0xFF0E151B),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             _buildIntroTexts(phoneNumber),
//
//             SizedBox(height: 20.h),
//             PinCodeField(onChanged: (code){
//               otpCode=code;
//             },),
//             SizedBox(height: 20.h),
//             InkWell(
//               onTap: () {
//                 // Add your resend logic here
//               },
//               child: Text(
//                 'لم أتلقَ أي رمز؟ أعد الإرسال مرة أخرى',
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 14.sp,
//                 ),
//               ),
//             ),
//             SizedBox(height: 90.h),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 120.w),
//               child: NextButton(onPressed: (){
//                 showDialogLoading(context);
//                 context.read<PhoneAuthCubit>().submitOTP(otpCode);
//
//
//               }),
//             ),
//             _buildPhoneVerificationBLoc()
//           ],
//         ),
//       ),
//     );
//   }}
//
// Widget _buildIntroTexts(String phoneNumber) {
//   return Column(
//     children: [
//       SizedBox(height: 120.h), // Adjust the space on top
//       Text(
//         'Verify your phone number',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24.sp,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       SizedBox(height: 20.h),
//       RichText(
//         textAlign: TextAlign.center,
//         text: TextSpan(
//           text: 'Enter your 6 digit code number sent to  ',
//           style: TextStyle(color: Colors.grey, fontSize: 16.sp),
//           children: <TextSpan>[
//             TextSpan(
//               text: phoneNumber,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16.sp,
//               ),
//             ),
//           ],
//         ),
//       ),
//
//     ],
//   );
// }