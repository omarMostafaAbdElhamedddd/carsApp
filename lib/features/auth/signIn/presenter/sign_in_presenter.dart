
import 'dart:convert';
import 'package:cars_app/features/auth/signIn/model/sign_in_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../../../home/view/homeView.dart';
import '../../../splashView/view/widgets/customText.dart';




enum AuthStatus { initial, loading, success, failure }

class AuthStatee {
  final AuthStatus status;

  AuthStatee(this.status);
}


class Sign_in_preseter extends Cubit<AuthStatee> {

  Sign_in_preseter() : super(AuthStatee(AuthStatus.initial));

  Future<void> login(String email , password, BuildContext context) async {
    emit(AuthStatee(AuthStatus.loading));

    final url = 'http://carsapi.runasp.net/api/Account/login';
    final Map<String,dynamic> data = Sign_in_model(email: email, password: password).toJson();

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json-patch+json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      emit(AuthStatee(AuthStatus.success));
       Get.to(() => HomeView(), transition: Transition.fadeIn);
      print('Sign in successful. Response: ${response.body}');
    } else if (response.statusCode == 400) {
      emit(AuthStatee(AuthStatus.failure));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Center(
            child: CustomText(
              text: 'Email not exists register now',
              color: Colors.white,
            )),
        backgroundColor: Color(0xff323232),
      ));
    } else {
      emit(AuthStatee(AuthStatus.failure));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Center(
            child: CustomText(
              text: 'Something went wrong',
              color: Colors.white,
            )),
        backgroundColor: Color(0xff323232),
      ));
    }
  }
}