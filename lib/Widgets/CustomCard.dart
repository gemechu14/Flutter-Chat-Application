import 'package:flutter/material.dart';
import 'package:peer_to_peer/page/chat/IndividualPage.dart';
import 'package:peer_to_peer/page/chat/chatModel.dart';

class CustumCard extends StatelessWidget {
  const CustumCard(
    this.chatModel,
    this.sourceChat
  );
  final ChatModel? chatModel;
  final ChatModel sourceChat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Route route = MaterialPageRoute(
            builder: (_) => IndividualPage(
                  chatModel: chatModel,
                  sourceModel: sourceChat,
                ));
        Navigator.push(context, route);
      },
      child: Column(
        children: [
          ListTile(
              leading: CircleAvatar(
                radius: 25,
                child: Icon(Icons.person),
              ),
              trailing: Text("12:33"),
              title: Text(
                chatModel!.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Expanded(
                    child: Text(
                      chatModel!.currentMessage,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Icon(Icons.done)
                ],
              )),
          Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
