import 'package:flutter/material.dart';

class CardTextWidget extends StatelessWidget {
  const CardTextWidget({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
