import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OnBoardModel {
  String titel;
  String desc;
  String image;
  OnBoardModel({
    required this.titel,
    required this.desc,
    required this.image,
  });
}

class Data {
  List<OnBoardModel> list = [
    OnBoardModel(titel: "30 days Meditation Challenge", desc: "100+ guided meditations covering anxiety, focus, stress, gratitude and more.", image: "assets/Meditation.png"),
    OnBoardModel(titel: "Choose your top goal", desc: "Practice your breathing, relax your body, listen the calming sound music make you feel better.", image: "assets/Mask Group (1).png"),
    OnBoardModel(titel: "Listen the calming music help you sleep", desc: "50+ music with the calming sound help you to fall asleep faster. Calm can change your life.", image: "assets/Mask Group (2).png"),
  ];
}
