// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final Function callback;
  // ignore: use_key_in_widget_constructors
  const TextInput(this.callback);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 18),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.message),
        suffixIcon: IconButton(
          onPressed: click,
          icon: const Icon(Icons.send),
          tooltip: 'Post Message',
        ),
        labelText: 'Type Message',
      ),
    );
  }
}
