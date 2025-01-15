import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isWide;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.isWide = false,
  });

  @override
  Widget build(BuildContext context) {
    final buttonSize = ResponsiveUtils.getButtonSize(context);
    final fontSize = ResponsiveUtils.getButtonFontSize(context);

    return SizedBox(
      width: isWide ? buttonSize * 2.2 : buttonSize,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: isWide ? const StadiumBorder() : const CircleBorder(),
          backgroundColor: backgroundColor,
          padding: ResponsiveUtils.getButtonPadding(context),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }
}