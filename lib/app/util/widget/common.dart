import 'package:flutter/material.dart';

/// 通用获取安全顶部距离
Widget safePadding(BuildContext context, {Color color = Colors.white}) {
  return Container(
    height: MediaQuery.of(context).padding.top,
    color: color,
  );
}
