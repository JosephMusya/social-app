import 'package:flutter/material.dart';
import '../data/post.dart';

class PostView extends StatefulWidget {
  final List<Post> listitems;
  // ignore: use_key_in_widget_constructors
  const PostView(this.listitems);
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  void like(Function callback) {
    setState(() {
      callback();
    });
  }

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
                    Text(
                      post.likes.toString(),
                      style: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    IconButton(
                      onPressed: () => like(post.likePost),
                      icon: Icon(
                        Icons.thumb_up,
                        color: post.userLiked ? Colors.blue : Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
