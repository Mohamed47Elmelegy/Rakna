import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFieldReport extends StatelessWidget {
  const CustomTextFieldReport(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.color});
  final String hint;
  final int maxLines;
  final Color? color;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is requird';
        } else {
          return null;
        }
      },
      cursorColor: Colors.white,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(Colors.white),
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color ?? Colors.white,
    ),
  );
}
