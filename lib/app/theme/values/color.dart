import 'package:flutter/cupertino.dart';

class JingluoStyle {
  static const Map<String, Color> _colors = {'system': Color(0xffffffff)};

  static Color getColor(String k) {
    return _colors[k] ?? _colors['system']!;
  }
}
