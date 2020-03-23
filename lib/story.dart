class Story {
  String storyTitle;
  String choice1;
  Story choice1Story;
  String choice2;
  Story choice2Story;
  bool isEnd;

  Story(
      {this.storyTitle,
      this.choice1,
      this.choice1Story,
      this.choice2,
      this.choice2Story,
      this.isEnd = false});
}
