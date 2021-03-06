import 'package:flutter/material.dart';

Widget CustomizedTextFormField({
  required TextEditingController Controller,
  required TextInputType Keyboard,
  required String Hint,
  required IconData PIcon,
  IconData? SIcon,
  bool Obsecure = false,
  Validation,
  int min = 1,
  bool max = false,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
      child: TextFormField(
        controller: Controller,
        keyboardType: Keyboard,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: Hint,
          prefixIcon: Icon(PIcon),
          suffixIcon: Icon(SIcon),
        ),
        validator: Validation,
        obscureText: Obsecure,
        minLines: min,
        maxLines: max ? null : 1,
      ),
    );
