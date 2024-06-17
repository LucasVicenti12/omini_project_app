import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;

  const InputPassword({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
  });

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _hidePassword = true;

  void _handleShowPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _hidePassword,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.white60,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide(
            color: Colors.green,
            width: 2.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        suffixIcon: IconButton(
          onPressed: _handleShowPassword,
          icon: Icon(
            _hidePassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
