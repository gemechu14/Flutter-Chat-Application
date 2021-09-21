import 'package:flutter/widgets.dart';

class ChatModel {
  String name;
  Icon icon;
  String currentMessage;
  String time;
  int id;

  ChatModel(
      {required this.name,required this.id,required this.icon,
      required this.currentMessage,
      required this.time});
}
