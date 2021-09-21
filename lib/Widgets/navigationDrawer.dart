import 'package:flutter/material.dart';
import 'package:peer_to_peer/MainPage/mainPage.dart';
import 'package:peer_to_peer/page/chat/chatModel.dart';
//import 'package:peer_to_peer/MainPage/home.dart';
import 'package:peer_to_peer/page/home_page.dart';
import 'package:peer_to_peer/page/logout_page.dart';
import 'package:peer_to_peer/page/message_page.dart';
import 'package:peer_to_peer/page/notifications_page.dart';
//import 'package:peer_to_peer/page/profile_page/profile_page.dart';
import 'package:peer_to_peer/page/profile_page/user_preferences.dart';
import 'package:peer_to_peer/page/setting_page.dart';
import 'package:peer_to_peer/page/status_page.dart';
import 'package:peer_to_peer/page/user_page.dart';

// ignore: must_be_immutable
class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final user = UserPreferences.myUser;
 late ChatModel sourceModel;

  @override
  Widget build(BuildContext context) {
    final AssetImage assetImage = AssetImage('images/gammee.jpg');

    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: MediaQuery.of(context).size.height - 44,
        color: Color.fromRGBO(70, 100, 75, 1),
        child: ListView(children: <Widget>[
          buildHeader(
            assetImage: assetImage,
            name: user.name,
            email: user.username,
            onClicked: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserPage(
                  name: user.name,
                  assetImage: assetImage,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                const SizedBox(height: 18),
                buildMenuItem(
                  text: 'News Feed',
                  icon: Icons.home,
                  onClicked: () {
                    Route route =
                        MaterialPageRoute(builder: (_) => MainScreen(null,sourceModel));
                    Navigator.pushReplacement(context, route);
                  },
                ),
                const SizedBox(height: 10),
                buildMenuItem(
                  text: 'Messages',
                  icon: Icons.message_outlined,
                  onClicked: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => MainScreen(
                              null,sourceModel
                            ));
                    Navigator.pushReplacement(context, route);
                  },
                ),
                const SizedBox(height: 10),
                buildMenuItem(
                  text: 'Status',
                  icon: Icons.stacked_bar_chart,
                  onClicked: () => selectedItem(context, 2),
                ),
                const SizedBox(height: 10),
                buildMenuItem(
                  text: 'Notifications',
                  icon: Icons.notifications,
                  onClicked: () {
                    Route route =
                        MaterialPageRoute(builder: (_) => MainScreen(null,sourceModel));
                    Navigator.pushReplacement(context, route);
                  },
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.white70),
                const SizedBox(height: 20),
                buildMenuItem(
                  text: 'Settings',
                  icon: Icons.settings,
                  onClicked: () => selectedItem(context, 4),
                ),
                const SizedBox(height: 10),
                buildMenuItem(
                  text: 'Logout',
                  icon: Icons.power,
                  onClicked: () => selectedItem(context, 5),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildHeader({
    required AssetImage assetImage,
    required String name,
    required String email,
    VoidCallback? onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: Ink.image(
                    image: assetImage,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                    child: InkWell(
                      onTap: onClicked,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(70, 100, 75, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    //Navigator.of(context).pop();
    switch (index) {
      case 0:
        Route route = MaterialPageRoute(builder: (_) => HomePage());
        Navigator.pushReplacement(context, route);
        break;
      case 1:
        Route route = MaterialPageRoute(builder: (_) => MessagePage());
        Navigator.pushReplacement(context, route);
        break;
      case 2:
        Route route = MaterialPageRoute(builder: (_) => StatusPage());
        Navigator.pushReplacement(context, route);
        break;
      case 3:
        Route route = MaterialPageRoute(builder: (_) => NotificationsPage());
        Navigator.pushReplacement(context, route);
        break;
      case 4:
        Route route = MaterialPageRoute(builder: (_) => SettingPage());
        Navigator.pushReplacement(context, route);
        break;
      case 5:
        Route route = MaterialPageRoute(builder: (_) => LogoutPage());
        Navigator.pushReplacement(context, route);
        break;
    }
  }
}
