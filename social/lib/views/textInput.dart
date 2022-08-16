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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        minLines: 2,
        maxLines: 15,
        keyboardType: TextInputType.multiline,
        style: const TextStyle(fontSize: 17),
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Type a shopping list...',
          suffixIcon: IconButton(
            onPressed: click,
            icon: const Icon(Icons.check),
            tooltip: 'Save shopping list',
          ),
          labelText: 'Shopping List',
        ),
      ),
    );
  }
}
