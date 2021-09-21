import 'package:flutter/material.dart';
import 'package:peer_to_peer/MainPage/home.dart';
import 'package:peer_to_peer/Widgets/navigationDrawer.dart';
//import 'package:peer_to_peer/Widgets/navigationDrawer.dart';
import 'package:peer_to_peer/page/chat/chatModel.dart';

import 'package:peer_to_peer/page/chat/chatPage.dart';
import 'package:peer_to_peer/page/peer_finderPage/peer_finder.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  MainScreen(this.chatModel,this.sourceModel);

  @override
  _MainScreenState createState() => _MainScreenState();

  final List<ChatModel>? chatModel;
  final ChatModel sourceModel;
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  String title = "TTMS";
  _MainScreenState();
  TabController? _controller;

  void initState() {
    _controller = TabController(length: 5, vsync: this, initialIndex: 2);

    setState(() {
     
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildTabs(context);
  }

  Widget buildTabs(BuildContext context) => (DefaultTabController(
      length: 5,
      child: new Scaffold(
        drawer: NavigationDrawerWidget(),
          body: new NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  title: Text(this.title),
                  floating: true,
                  pinned: true,
                  snap: true,
                  bottom: new TabBar(controller: _controller, tabs: <Tab>[
                    Tab(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.notification_add,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )
                  ] // <-- total of 2 tabs
                      ),
                ),
              ];
            },
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white30, Colors.white12],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
              child: TabBarView(controller: _controller, children: [
                Home(),
                PeerFinder("PeerFinder"),
                ChatPage(widget.chatModel,widget.sourceModel),
                Home(),
                Home(),
              ]),
            ),
          ))));
}
