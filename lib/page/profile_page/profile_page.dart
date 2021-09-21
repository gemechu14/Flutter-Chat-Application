import 'package:flutter/material.dart';
import 'package:peer_to_peer/page/profile_page/button_widget.dart';
import 'package:peer_to_peer/page/profile_page/profile_appbar.dart';
import 'package:peer_to_peer/page/profile_page/profile_widget.dart';
import 'package:peer_to_peer/page/profile_page/user.dart';
import 'package:peer_to_peer/page/profile_page/user_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20,),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton(),),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.username,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.email,
          style: TextStyle(color: Colors.blueGrey),
        )
      ]);
  
  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Update Profile',
    onClicked: () {},
  );
}
