class Post {
  String body = '';
  String user = '';
  bool done = false;

  Post(this.body, this.user, this.done);

  void likePost() {
    if (!done) {
      done = true;
    } else if (done) {
      done = false;
    }
  }
}
