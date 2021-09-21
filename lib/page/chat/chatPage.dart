import 'package:flutter/material.dart';
import 'package:peer_to_peer/Widgets/CustomCard.dart';

import 'package:peer_to_peer/page/chat/chatModel.dart';


class ChatPage extends StatefulWidget {
  ChatPage(this.chatModel,this.sourceModel);
  _ChatPage createState() => _ChatPage();
  final List<ChatModel>? chatModel;
  ChatModel sourceModel;
}

class _ChatPage extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.chatModel!.length,
          itemBuilder: (contex, index) => CustumCard(
                widget.chatModel![index],
                widget.sourceModel
              )),
    );
  }
}
