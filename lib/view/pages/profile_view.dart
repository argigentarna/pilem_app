import 'package:flutter/material.dart';
import '../widgets/profile_tile.dart';
import '../widgets/welcome_speech.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        SizedBox(
          height: 30,
        ),
        WelcomeSpeech(
          title: 'Hello, Argi Gentarna!',
        ),
        ProfileTile(
          title: 'Bio',
          description: 'I am Flutter Engineer',
        ),
        ProfileTile(
          title: 'Birthday',
          description: '10 January 1992',
        ),
        ProfileTile(
          title: 'Account Status',
          description: 'Premium',
        ),
        ProfileTile(
          title: 'Genre',
          description: 'Male',
        ),
        ProfileTile(
          title: 'Favorite',
          description: 'Action, Adventure, Sport',
        ),
      ],
    );
  }
}
