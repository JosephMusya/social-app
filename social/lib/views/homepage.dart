import 'package:flutter/material.dart';
import 'package:social/views/postdisplay.dart';
import 'package:social/views/textInput.dart';
import '../data/post.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String name = '';
  HomePage(this.name, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '';
  List<Post> posts = [];

  void submit(text) {
    setState(() {
      this.text = text;
      posts.add(Post(text, widget.name, 0, false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Social App"),
        ),
        body: Column(
          children: [
            Expanded(child: PostView(posts)),
            TextInput(submit),
          ],
        ));
  }
}
