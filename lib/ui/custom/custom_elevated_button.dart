import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    this.onPressed,
    this.color,
    this.height: 50,
    this.textColor,
    this.text,
    this.imageAsset: "",
  });

  final VoidCallback onPressed;
  final Color color;
  final double height;
  final Color textColor;
  final String text;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(imageAsset),
            Text(
              text,
              style: TextStyle(fontSize: 15, color: textColor),
            ),
            Opacity(
              child: Image.asset(imageAsset),
              opacity: 0,
            ),
          ],
        ),
      ),
    );
  }
}
