import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pilem_app/view_model/page_view_model.dart';
import 'package:provider/provider.dart';

import '../../res/color.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        bottom: 32,
      ),
      child: Align(
        alignment: const Alignment(0.0, 1.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          child: SizedBox(
            height: 90,
            child: Consumer<PageViewModel>(
              builder: (_, value, ch) => BottomNavigationBar(
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.whiteColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: AppColors.secondaryColor,
                currentIndex: value.currentIndex,
                onTap: (int index) {
                  if (kDebugMode) {
                    print("Check tap");
                    print(index.toString());
                  }
                  value.currentIndex = index;
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_work_outlined,
                      size: 25,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.tv_sharp,
                      size: 25,
                    ),
                    label: "Television",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.man,
                      size: 25,
                    ),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
