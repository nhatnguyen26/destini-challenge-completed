import 'story.dart';

class StoryBrain {
  Story _defaultStory;
  Story _currentStory;

  StoryBrain() {
    Story storyEnd3 = Story(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: '',
        isEnd: true);

    Story storyEnd4 = Story(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: '',
        isEnd: true);

    Story storyEnd5 = Story(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '',
        isEnd: true);

    Story storyMid2 = Story(
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice1Story: storyEnd5,
        choice2: 'It\'s him or me! You take the knife and stab him.',
        choice2Story: storyEnd4);

    Story storyMid1 = Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice1Story: storyMid2,
        choice2: 'Wait, I know how to change a tire.',
        choice2Story: storyEnd3);

    Story storyStart0 = Story(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice1Story: storyMid2,
        choice2: 'Better ask him if he\'s a murderer first.',
        choice2Story: storyMid1);

    _defaultStory = storyStart0;
    _currentStory = storyStart0;
  }

  String getStory() {
    return _currentStory.storyTitle;
  }

  String getChoice1() {
    return _currentStory.choice1;
  }

  String getChoice2() {
    return _currentStory.choice2;
  }

  void nextStory(int choiceNumber) {
    if (_currentStory.isEnd) {
      reset();
    } else {
      if (choiceNumber == 1) {
        _currentStory = _currentStory.choice1Story;
      } else if (choiceNumber == 2) {
        _currentStory = _currentStory.choice2Story;
      }
    }
  }

  void reset() {
    _currentStory = _defaultStory;
  }

  bool buttonShouldBeVisible() {
    return !_currentStory.isEnd;
  }
}
