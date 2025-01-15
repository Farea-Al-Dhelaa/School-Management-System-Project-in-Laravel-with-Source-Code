import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';

class CalculatorDisplay extends StatelessWidget {
  final String text;

  const CalculatorDisplay({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: ResponsiveUtils.getDisplayFontSize(context),
            ),
          )
        ],
      ),
    );
  }
}
