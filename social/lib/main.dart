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
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Social App')),
        ),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    var post = posts[index];
                    print(post.body);
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
                        )
                      ],
                    ));
                  })),
          const SizedBox(width: 50),
          Expanded(
            child: Container(
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
                )),
          ),
        ]));
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
