import 'package:flutter/material.dart';


import 'package:peer_to_peer/page/profile_page/user_preferences.dart';

class Home extends StatefulWidget {
  _Home createState() => _Home();
 
 // ignore: empty_constructor_bodies

}

class _Home extends State<Home> {
  
  
  final user = UserPreferences.myUser;
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Container(
              height: 300.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromRGBO(70, 100, 75, 1),
                    ),
                    title: Text(user.name),
                    subtitle: Text("Tue August 01 2021"),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        maxLines: 8,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          enabled: false,
                          hintText:
                              'Ani Eebbaa Wadaajoon jedhama; Shawaa Lixaa Tokkee Kuttaayeettin '
                              'Fiiziksii barsiisuun tajaajilaan jira. Barsiisummaan waggaa 6 tajaajilee, '
                              ' hoggansa mana barumsaarra (amma gitan irra jiru) waggaa 3ffaafin hojjetaa jira. '
                              'Wallagga Bahaatii gara kanatti kan dhufuu barbaadu yoo jiraate, keessaan '
                              'na haa quunnamu. Ulfaadhaa!',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 14.0,
                          ),
                          Icon(Icons.thumb_up, color: Colors.grey),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Like",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 14.0,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.comment, color: Colors.grey),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Comment",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 14.0,
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.share, color: Colors.grey),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Share",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
