import 'package:flutter/material.dart';

class ButtonOval extends StatelessWidget {
  const ButtonOval({required this.buttonText, required this.onPress, Key? key})
      : super(key: key);

  final Widget buttonText;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.grey[300],
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: buttonText,
      ),
    );
  }
}
