import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.backgroundColor = Colors.blueAccent,
      this.textColor = Colors.white,
      this.width = double.infinity,
        this.height = 55})
      : super(key: key);

  final Function onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: ()=>onPressed(),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor)),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
