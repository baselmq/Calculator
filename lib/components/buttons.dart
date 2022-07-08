import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.buttonText,
      required this.color,
      required this.textColor,
      required this.onPress,
      this.iconBtn,
      Key? key})
      : super(key: key);
  final Color color;
  final Color textColor;
  final Widget buttonText;
  final Function() onPress;
  final Icon? iconBtn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color,
          onPrimary: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: iconBtn ?? buttonText,
      ),
    );
  }
}


// class CustomButton extends StatelessWidget {
// const CustomButton(
//     {required this.buttonText,
//     required this.color,
//     required this.textColor,
//     required this.onPress,
//      this.iconBtn,
//     Key? key})
//     : super(key: key);
// final Color color;
// final Color textColor;
// final String buttonText;
// final Function() onPress;
//  final Icon? iconBtn;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPress,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: Container(
//             color: color,
//             child: Center(
//               child: Text(
//                 buttonText,
//                 style: TextStyle(
//                   color: textColor,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
