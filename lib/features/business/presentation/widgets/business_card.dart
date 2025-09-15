import 'package:flutter/material.dart';
/// BusinessCard is a reusable and customizable widget.
/// It can render any content via the [child] parameter and supports tap actions through [onTap].
/// This design allows it to be used for different models (e.g., BusinessEntity, ServiceEntity),
/// making it flexible, clean, and easy to maintain.
class BusinessCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const BusinessCard({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(padding: const EdgeInsets.all(16.0), child: child),
      ),
    );
  }
}
