import 'package:flutter/material.dart';
import 'package:google_form/commone/appColor.dart';

class TextFormFeild extends StatelessWidget {
  const TextFormFeild(
      {super.key,
      required this.hintTextName,
      required this.labelName,
      required this.nameController});
  final TextEditingController nameController;
  final String labelName;
  final String hintTextName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: kPrimaryColor)),
        hintText: hintTextName,
        labelText: labelName,
      ),
    );
  }
}
