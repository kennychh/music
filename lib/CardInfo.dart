import 'package:flutter/material.dart';

class CardInfo {

  String cardTitle;
  IconData icon;
  int tasksRemaining;
  double taskCompletion;
  AssetImage image;
  String imagePath;
  bool endOfList;
  bool playlist;
  String artist;
  List<String> songs;
  CardInfo(this.cardTitle, this.image,this.imagePath,[this.endOfList, this.songs, this.artist, this.playlist]);


}