import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AvatarPicture extends StatelessWidget {
  final String? imgProfile;
  final double size;
  final EdgeInsetsGeometry? customMargin;

  const AvatarPicture({
    super.key,
    this.imgProfile,
    required this.size,
    this.customMargin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: customMargin,
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(
            imgProfile!,
          )
              // : NetworkImage(
              //     state.user.profilePicture!,
              //   ) as ImageProvider,
              ),
        ),
      ),
    );
  }
}
