import 'package:ecommerce_demo/utils/constants.dart';
import 'package:flutter/material.dart';
//import '../constant.dart';

Widget buildTextField(
  String label, {
  required TextEditingController controller,
  bool obscure = false,
  TextInputType keyboardType = TextInputType.text,
  String? Function(String?)? validator,
  TextCapitalization textCapitalization = TextCapitalization.none,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: kBlackColor,
      style: const TextStyle(fontFamily: 'Inter_regular', fontSize: 18),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Inter_regular',
        ),
        border: const UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kBlackColor, width: 2),
        ),
        errorStyle: const TextStyle(fontSize: 14, fontFamily: 'Inter_regular'),
      ),
    ),
  );
}
