import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color color;

  const AppButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
    this.color = const Color.fromARGB(255, 46, 108, 48),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: onPressed,
          icon: icon != null
              ? Icon(icon, color: Colors.white)
              : const SizedBox.shrink(),
          label: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
