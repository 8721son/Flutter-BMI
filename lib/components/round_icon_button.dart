import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final onPressed;

  const RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      fillColor: Colors.grey[700],
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
    );
  }
}