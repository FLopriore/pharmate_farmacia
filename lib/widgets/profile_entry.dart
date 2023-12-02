import 'package:flutter/material.dart';

class ProfileEntry extends StatelessWidget {
  final String textParam;
  final String textEntry;
  const ProfileEntry(
      {super.key, required this.textParam, required this.textEntry});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            textParam,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.end,
          ),
        ),
        Text(
          textEntry,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
