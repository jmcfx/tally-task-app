import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16 , fontWeight: FontWeight.w700) )),
      ],
    );
  }
}
