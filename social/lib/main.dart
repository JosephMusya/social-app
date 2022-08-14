import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Social App')),
        ),
        body: Column(children: [
          Expanded(child: DisplayPost(['Hello This is a simple post'])),
          const SizedBox(width: 50),
          const Expanded(child: InputMessage()),
        ]));
  }
}

class InputMessage extends StatefulWidget {
  const InputMessage({Key? key}) : super(key: key);

  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  final controller = TextEditingController();
  String text = '';
  List<Post> posts = [];
  void submit() {
    setState(() {
      text = controller.text;
      posts.add(Post(text, 'Joe', 0, 'Joe'));
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(18.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.message),
            suffixIcon: IconButton(
              onPressed: submit,
              icon: const Icon(Icons.send),
              tooltip: 'Post Message',
            ),
            labelText: 'Type Message',
          ),
          // onChanged: (text) => changeInput(text),
        ));
  }
}

class Post {
  String body = '';
  String author = '';
  int likes = 0;
  bool userLiked = false;

  Post(body, author, likes, userLiked);

  void likePost() {
    if (!userLiked) {
      userLiked = true;
      likes += 1;
    }
    userLiked = false;
    likes -= 1;
  }
}

class DisplayPost extends StatefulWidget {
  final List<Post> listitems = [];
  DisplayPost(listitems, {Key? key}) : super(key: key);

  @override
  State<DisplayPost> createState() => _DisplayPostState();
}

class _DisplayPostState extends State<DisplayPost> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
