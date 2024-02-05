import 'package:flutter/material.dart';

class StyleTheme extends ChangeNotifier {
  BoxDecoration get cardStyle => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 4.0)],
      );

  BoxDecoration get cardDetailedStyle => BoxDecoration(
        color: const Color.fromARGB(255, 70, 69, 69),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(color: Color.fromARGB(255, 70, 69, 69), blurRadius: 4.0)
        ],
      );
}
