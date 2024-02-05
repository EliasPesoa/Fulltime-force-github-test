import 'package:flutter/material.dart';

class StyleTheme extends ChangeNotifier {
  BoxDecoration get cardStyle => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 4.0)],
      );
}
