import 'package:flutter/material.dart';
import 'data/post.dart';
import 'views/textInput.dart';
import 'views/postdisplay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Social App',
      home: MainBody(),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  String text = '';
  List<Post> posts = [];

  void submit(text) {
    setState(() {
      this.text = text;
      posts.add(Post(text, 'Joe', 0, false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Social App')),
      ),
      body: Column(
        children: [
          Expanded(child: PostView(posts)),
          const SizedBox(width: 50),
          TextInput(submit)
        ],
      ),
    );
  }
}
