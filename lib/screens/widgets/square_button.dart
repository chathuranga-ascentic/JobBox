import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  const SquareButton(
      {Key? key,
      required this.btnTitle,
      required this.bgColor,
      required this.textColor,
      this.fontSize = 18.0,
      required this.onPress,
      this.fontWeight = FontWeight.w600,
      this.height = 50})
      : super(key: key);

  final String btnTitle;
  final Color bgColor;
  final Color textColor;
  final Function onPress;
  final double fontSize;

  final FontWeight? fontWeight;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
          primary: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: () => onPress(),
        child: Text(btnTitle,
            style: TextStyle(
                fontSize: fontSize, fontWeight: fontWeight, color: textColor)),
      ),
    );
  }
}
