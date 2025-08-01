import 'package:flutter/material.dart';
import 'package:tasktracker/constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.label,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: GlobalVariables.buttonColor,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      child: Text(
        label,
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
