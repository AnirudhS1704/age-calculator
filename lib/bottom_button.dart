import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.text, required this.onTap});
  final Text text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: text,
        ),
        color: bottomContainerColour,
        margin: EdgeInsets.only(top: 5),
        width: double.infinity,
        height: bottomContainerHeight.toDouble(),
      ),
      onTap: () {
        onTap;
      },
    );
  }
}
