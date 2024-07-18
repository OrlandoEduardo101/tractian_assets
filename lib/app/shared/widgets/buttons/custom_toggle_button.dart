import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onPressed;

  const CustomToggleButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8.0),
          Text(text),
        ],
      ),
    );
  }
}
