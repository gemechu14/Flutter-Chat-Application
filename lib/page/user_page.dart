import 'package:flutter/material.dart';
import 'package:peer_to_peer/page/profile_page/profile_page.dart';

class UserPage extends StatelessWidget {
  final String name;
  final AssetImage assetImage;

  const UserPage({
    required this.name,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ProfilePage(),
  );
}
