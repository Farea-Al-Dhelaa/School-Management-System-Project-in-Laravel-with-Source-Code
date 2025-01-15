import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/calculator_provider.dart';
import '../widgets/calculator_button.dart';
import '../widgets/calculator_display.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Consumer<CalculatorProvider>(
            builder: (context, provider, _) =>
                CalculatorDisplay(text: provider.state.finalResult),
          ),
          _buildButtonRow(['AC', '+/-', '%', '/'], context),
          const SizedBox(height: 10),
          _buildButtonRow(['7', '8', '9', 'x'], context),
          const SizedBox(height: 10),
          _buildButtonRow(['4', '5', '6', '-'], context),
          const SizedBox(height: 10),
          _buildButtonRow(['1', '2', '3', '+'], context),
          const SizedBox(height: 10),
          _buildLastRow(context),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((button) => _buildButton(button, context)).toList(),
    );
  }

  Widget _buildButton(String text, BuildContext context) {
    Color backgroundColor;
    Color textColor;

    if ('+-x/'.contains(text)) {
      backgroundColor = Theme.of(context).primaryColor;
      textColor = Colors.white;
    } else if ('AC+/-%'.contains(text)) {
      backgroundColor = Color.alphaBlend(
          Colors.white.withOpacity(0.1), const Color(0xF75C5C5F));
      textColor = Colors.white;
    } else {
      backgroundColor = Theme.of(context)
              .elevatedButtonTheme
              .style
              ?.backgroundColor
              ?.resolve({}) ??
          Colors.grey[850]!;
      textColor = Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white;
    }

    return CalculatorButton(
      text: text,
      backgroundColor: backgroundColor,
      textColor: textColor,
      onPressed: () => context.read<CalculatorProvider>().calculate(text),
    );
  }

  Widget _buildLastRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CalculatorButton(
          text: '0',
          backgroundColor: Theme.of(context)
              .elevatedButtonTheme
              .style
              ?.backgroundColor
              ?.resolve({}) ??
              Colors.grey[900]!,

          textColor:
              Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white,
          onPressed: () => context.read<CalculatorProvider>().calculate('0'),
          isWide: true,
        ),
        _buildButton('.', context),
        _buildButton('=', context),
      ],
    );
  }
}
