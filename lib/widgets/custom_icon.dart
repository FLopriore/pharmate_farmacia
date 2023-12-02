import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final double height;
  final double width;

  const CustomIcon(
      {Key? key, required this.icon, this.height = 60, this.width = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(icon),
      color: null,
      height: height,
      width: width,
    );
  }
}
