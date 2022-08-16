import 'package:flutter/material.dart';
import 'package:social/views/postdisplay.dart';
import 'package:social/views/textInput.dart';
import '../data/post.dart';
import '../data/sharedPreferences.dart';

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
  bool show = false;

  void toggle() {
    if (!show) {
      show = true;
    } else if (show) {
      show = false;
    }
    setState(() {
      show;
    });
  }

  void submit(text) {
    setState(() {
      this.text = text;
      posts.add(Post(text, widget.name, false));
      savePost(posts);
    });
  }

  void savePost(posts) async => await UserSharedPreferences.setPost(posts);

  @override
  void initState() {
    super.initState();
    UserSharedPreferences.init();
    posts = UserSharedPreferences.getPosts() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    bool showAdd = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        appBar: AppBar(
          actions: [
            Align(
              alignment: Alignment.bottomRight,
              child: Visibility(
                visible: (!showAdd),
                child: IconButton(
                  onPressed: toggle,
                  icon: show
                      ? const Icon(Icons.minimize_sharp)
                      : const Icon(Icons.add),
                ),
              ),
            )
          ],
          title: const Text("Social App"),
        ),
        body: Column(
          children: [
            Expanded(child: PostView(posts)),
            Visibility(visible: (show), child: TextInput(submit)),
          ],
        ));
  }
}
