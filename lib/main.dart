import 'package:cars_app/features/auth/signIn/presenter/sign_in_presenter.dart';
import 'package:cars_app/features/auth/signUp/presenter/sign_up_presenter.dart';
import 'package:cars_app/utitls/resposiveSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'features/splashView/view/splashView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    SizeConfig().init(context);
    return MultiProvider(
      providers: [
        BlocProvider<Sign_in_preseter>(create: (context) => Sign_in_preseter()),
        BlocProvider<Sign_up_presenter>(
            create: (context) => Sign_up_presenter()),
      ],
      child: GetMaterialApp(
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          title: 'be connnected',
          home: SplashView()),
    );
  }
}
