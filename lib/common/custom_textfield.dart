import 'package:flutter/material.dart';
import 'package:tasktracker/constants/global_variables.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final bool obscureText;
  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLines = 1,
      this.obscureText = false});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _obscure;
  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: GlobalVariables.buttonColor,
      obscureText: _obscure,
      decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: GlobalVariables.buttonColor))),
      maxLines: widget.maxLines,
    );
  }
}
