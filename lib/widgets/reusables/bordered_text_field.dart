import 'package:flutter/material.dart';
import 'package:flutter_provider_starter/themes/theme.dart';

class BorderedTextField extends StatefulWidget {
  final String? initialText;
  final String labelText;
  final ValueChanged<String> onChanged;

  const BorderedTextField(
      {Key? key,
      this.initialText,
      required this.labelText,
      required this.onChanged})
      : super(key: key);

  @override
  _BorderedTextFieldState createState() => _BorderedTextFieldState();
}

class _BorderedTextFieldState extends State<BorderedTextField> {
  late TextEditingController _textEditingController;
  final _focusNode = FocusNode();

  @override
  void initState() {
    if (widget.initialText != null) {
      _textEditingController = TextEditingController.fromValue(TextEditingValue(
          text: widget.initialText!,
          selection: TextSelection.fromPosition(
              TextPosition(offset: widget.initialText!.length))));
    } else {
      _textEditingController = TextEditingController();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      focusNode: _focusNode,
      onChanged: widget.onChanged,
      style: const TextStyle(color: black65),
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: dark),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
