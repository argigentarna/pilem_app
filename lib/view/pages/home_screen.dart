// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pilem_app/res/color.dart';
import 'package:pilem_app/view/pages/movie_view.dart';
import 'package:pilem_app/view/pages/profile_view.dart';
import 'package:pilem_app/view/pages/tv_view.dart';
import 'package:pilem_app/view/widgets/bottom_navigation.dart';
import 'package:pilem_app/view_model/page_view_model.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          const BottomNavigation(),
          buildBody(),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Consumer<PageViewModel>(builder: (_, value, ch) {
      switch (value.currentIndex) {
        case 0:
          return const MovieView();
        case 1:
          return const TvView();
        case 2:
          return const ProfileView();
        default:
          return const MovieView();
      }
    });
  }
}
