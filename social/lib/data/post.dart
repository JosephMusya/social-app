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
