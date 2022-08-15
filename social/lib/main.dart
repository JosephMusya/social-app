// ignore_for_file: use_key_in_widget_constructors

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
        body: Column(children: [
          Expanded(child: PostView(posts)),
          const SizedBox(width: 50),
          Expanded(child: TextInput(submit))
        ]));
  }
}

class TextInput extends StatefulWidget {
  final Function callback;
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
    print("Submited....");
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
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

class Post {
  String body = '';
  String author = '';
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author, this.likes, this.userLiked);

  void likePost() {
    if (!userLiked) {
      userLiked = true;
      likes += 1;
    }
    userLiked = false;
    likes -= 1;
  }
}

class PostView extends StatefulWidget {
  final List<Post> listitems;
  const PostView(this.listitems);
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listitems.length,
        itemBuilder: (context, index) {
          var post = widget.listitems[index];
          return Card(
            child: Row(
              children: [
                Expanded(
                    child: ListTile(
                  title: Text(post.body),
                  subtitle: Text(post.author),
                )),
                Row(
                  children: [
                    IconButton(
                        onPressed: post.likePost,
                        icon: const Icon(Icons.thumb_up)),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
