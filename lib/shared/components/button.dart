import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function()? onClick;
  final String label;
  final ButtonType type;
  final bool fullWidth;

  const Button({
    super.key,
    required this.onClick,
    required this.label,
    this.type = ButtonType.normal,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle;

    switch (type) {
      case ButtonType.normal:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
            side: const BorderSide(
              style: BorderStyle.solid,
              width: 2.0,
              color: Colors.white12
            ),
          ),
        );
        break;
      case ButtonType.action:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        );
        break;
    }

    final button = ElevatedButton(
      style: buttonStyle,
      onPressed: onClick,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );

    if (fullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}

enum ButtonType { normal, action }
