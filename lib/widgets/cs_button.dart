import 'package:flutter/material.dart';

class CsButton extends StatelessWidget {
  const CsButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.backgroundColor,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor = this.backgroundColor ?? theme.primaryColor;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )),
        elevation: MaterialStateProperty.all(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon),
            const SizedBox(width: 5),
          ],
          Text('$label'),
        ],
      ),
    );
  }
}
