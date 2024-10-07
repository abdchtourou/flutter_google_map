part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}
final class PhoneAuthLoading extends PhoneAuthState {}
final class PhoneAuthErrorOccurred extends PhoneAuthState {

  final String errorMsg;

  PhoneAuthErrorOccurred({required this.errorMsg});
}
final class PhoneAuthPhoneNumberSubmit extends PhoneAuthState {}
final class PhoneAuthPhoneOTPVerify extends PhoneAuthState {}
