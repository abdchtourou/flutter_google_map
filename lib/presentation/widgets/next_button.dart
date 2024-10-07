import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key,required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Alignment.centerRight ,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(110, 50),
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
          onPressed: onPressed,
          child: const Text(
            "Next",
            style: TextStyle(color: Colors.white, fontSize: 16),
          )),
    );
  }
}
