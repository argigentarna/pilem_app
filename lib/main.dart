import 'package:flutter/material.dart';
import 'package:pilem_app/res/color.dart';
import 'package:pilem_app/res/textstyle.dart';
import 'package:pilem_app/res/theme.dart';
import 'package:pilem_app/utils/routes/routes.dart';
import 'package:pilem_app/utils/routes/routes_name.dart';
import 'package:pilem_app/view/pages/splash_view.dart';
import 'package:pilem_app/view_model/auth_view_model.dart';
import 'package:pilem_app/view_model/home_view_model.dart';
import 'package:pilem_app/view_model/page_view_model.dart';
import 'package:pilem_app/view_model/tv_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => PageViewModel()),
        ChangeNotifierProvider(create: (_) => TvViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.blackColor,
          primarySwatch: AppColors.buildMaterialColor(
            AppColors.primaryColor,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.blackColor,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: AppStyle.tAppbar,
          ),
        ),
        home: const SplashView(),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
