import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddStockTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const AddStockTextField({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          fillColor: Colors.white,
          filled: true,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ]);
  }
}
