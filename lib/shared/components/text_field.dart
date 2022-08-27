import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField(
      {Key? key, required this.controller, required this.validate, required this.keyboardType, required this.labelText, this.hintText, this.prefix, this.isPassword = false})
      : super(key: key);

  final TextEditingController controller;
  final String? Function(String?) validate;
  final TextInputType keyboardType;
  final String? labelText;
  final String? hintText;
  final Icon? prefix;
  final bool isPassword;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validate,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword? isVisible:false,
      decoration: InputDecoration(
          label: Text(widget.labelText!),
          hintText: widget.hintText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.isPassword?GestureDetector(
            onTap: () {
              setState(() {
                isVisible= !isVisible;
              });
            },
            child: Icon(isVisible ? Icons.visibility: Icons.visibility_off),
          ):null,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2),
            borderRadius: BorderRadius.circular(4),
          )

      ),
    );
  }
}
