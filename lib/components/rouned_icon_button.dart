import 'package:flutter/material.dart';

class RounedIconButton extends StatelessWidget {
  const RounedIconButton({Key? key, required this.icon, required this.onPessed})
      : super(key: key);
  final IconData icon;
  final Function() onPessed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPessed,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
    );
  }
}
