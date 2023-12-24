import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {super.key,
      required this.label,
      required this.hint,
      this.uneicon,
      this.valider,
      required this.inty,
      this.save});
  final String label;
  final String hint;
  final IconData? uneicon;
  final String? Function(String?)? valider;
  final TextInputType? inty;
  final String? Function(String?)? save;
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: TextFormField(
        style: TextStyle(color: Colors.green),
        keyboardType: inty,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          label: Text(label),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.blue),
          prefixIcon: Icon(uneicon, color: Colors.blue),
        ),
        validator: valider,
        onSaved: save,
      ),
    );
  }
}
