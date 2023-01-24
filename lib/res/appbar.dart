import 'package:flutter/material.dart';

import 'components/appbar_back_button.dart';

class Appbar {
  static PreferredSizeWidget primaryAppbar(
    String title,
    VoidCallback onPress,
  ) {
    return AppBar(
      title: Text(
        title,
      ),
      centerTitle: true,
      leading: AppbarBackButton(
        onPress: onPress,
      ),
    );
  }
}
