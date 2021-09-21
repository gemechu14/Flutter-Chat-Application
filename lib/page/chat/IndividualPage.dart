import 'package:peer_to_peer/page/chat/MessageModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:peer_to_peer/page/chat/chatModel.dart';
import 'package:peer_to_peer/page/chat/onMessageChat.dart';
import 'package:peer_to_peer/page/chat/replayCard.dart';

// ignore: must_be_immutable
class IndividualPage extends StatefulWidget {
  IndividualPage({Key? key, this.chatModel, required this.sourceModel})
      : super(key: key);
  final ChatModel? chatModel;
  ChatModel sourceModel;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  late IO.Socket socket;
  bool sendButton = false;

  List<MessageModel> messages = [];

  TextEditingController _textEditingController = new TextEditingController();
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });

    connect();
  }

  void connect() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket = IO.io("http://192.168.0.35:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("signin", widget.sourceModel.id);

    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        setMessage("destination", msg["message"]);
        print(msg);
      });
    });
    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(type: type, message: message);

    setState(() {
      setState(() {
        messages.add(messageModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Icon(Icons.arrow_back),
                CircleAvatar(
                  child: Icon(
                    Icons.person,
                  ),
                  radius: 20,
                  backgroundColor: Colors.lightGreen,
                )
              ],
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.chatModel!.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Last seen an hour ago ",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    child: Row(
                  children: [Icon(Icons.delete), Text("Delete Message")],
                )),
                PopupMenuItem(
                    child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                    Icon(Icons.ac_unit_outlined),
                    Text("Delete Message")
                  ],
                )),
                PopupMenuItem(
                    child: Row(
                  children: [Icon(Icons.delete), Text("Delete Message")],
                ))
              ];
            },
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WillPopScope(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 140,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    if (messages[index].type == "source") {
                      return OnMessageCard(messages[index].message);
                    } else
                      return ReplayCard(messages[index].message);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                                margin: EdgeInsets.only(
                                    left: 5, right: 5, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.length > 0) {
                                      setState(() {
                                        sendButton = true;
                                      });
                                    } else {
                                      setState(() {
                                        sendButton = false;
                                      });
                                    }
                                  },
                                  focusNode: focusNode,
                                  controller: _textEditingController,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type Message",
                                      prefixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            show = !show;
                                          });
                                        },
                                        icon: Icon(Icons.attach_file),
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (_) =>
                                                        bottomSheet());
                                              },
                                              icon: Icon(Icons.emoji_emotions)),
                                          sendButton
                                              ? IconButton(
                                                  onPressed: () {
                                                    if (sendButton) {
                                                      sendMessage(
                                                          _textEditingController
                                                              .text,
                                                          widget.sourceModel.id,
                                                          widget.chatModel!.id);
                                                      _textEditingController
                                                          .clear();
                                                    }
                                                  },
                                                  icon: Icon(Icons.send))
                                              : IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.video_call))
                                        ],
                                      )),
                                ))),
                      ],
                    ),
                    // SizedBox(child: show ? emojePicker() : Container())
                  ],
                ),
              )
            ],
          ),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  // emojePicker() {
  //   return EmojiPicker(
  //     rows: 4,
  //     columns: 7,
  //     numRecommended: 10,
  //     buttonMode: ButtonMode.MATERIAL,
  //     onEmojiSelected: (Emoji emoji, Category category) {
  //       setState(() {
  //         _textEditingController.text =
  //             _textEditingController.text + emoji.emoji;
  //       });
  //     },
  //   );
  // }

  Widget bottomSheet() {
    return Container(
      height: 277,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(18),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                iconCreation(
                    Icons.insert_drive_file, "Document", Colors.indigo),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.camera_alt, "Camera", Colors.pink),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.photo, "Gallery", Colors.purple),
              ]),
              SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                iconCreation(Icons.headset, "Audio  ", Colors.orange),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.location_pin, "Location", Colors.pink),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.contact_mail, "Contacts", Colors.blue),
              ]),

              //  Row(
              //        mainAxisAlignment: MainAxisAlignment.center,
              //   children:[
              //     iconCreation(Icons.headset,"Audio",Colors.orange),
              //     SizedBox(width: 40,),
              //     iconCreation(Icons.location_pin,"Location",Colors.pink),
              //        SizedBox(width: 40,),
              //     iconCreation(Icons.contact_mail,"Contacts",Colors.blue),
              //   ]
              // ),
            ],
          ),
        ),
      ),
    );
  }

  iconCreation(IconData icons, String title, Color color) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
            child: Icon(
              icons,
              color: Colors.white,
              size: 29,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
