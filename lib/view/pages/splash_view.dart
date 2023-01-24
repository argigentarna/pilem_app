import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pilem_app/res/color.dart';
import 'package:pilem_app/res/const.dart';

import '../../utils/routes/routes_name.dart';
import '../../view_model/auth_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  AuthViewModel authViewModel = AuthViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      authViewModel.fetchGenres();
      Navigator.pushNamed(context, RoutesName.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Image.asset(
          AppConst.imgLogo,
          width: 200,
        ),
      ),
    );
  }
}
