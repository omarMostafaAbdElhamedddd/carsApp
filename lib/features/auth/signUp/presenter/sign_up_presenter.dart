import 'dart:convert';


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

class Sign_up_presenter extends Cubit<AuthStatee> {
  Sign_up_presenter() : super(AuthStatee(AuthStatus.initial));

  Future<void> registerUser(
      String email, String password, String name, BuildContext context) async {
    emit(AuthStatee(AuthStatus.loading));

    final url =
        'http://carsapi.runasp.net/api/Account/register?PersonName=$name&Email=$email&Password=$password';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'access-control-allow-origin': '*',
        'content-type': 'application/problem+json; charset=utf-8',
        // Add other headers as needed
      },
    );

    if (response.statusCode == 200) {
      emit(AuthStatee(AuthStatus.success));
      Get.to(() => HomeView(), transition: Transition.fadeIn);
    } else if (response.statusCode == 400) {
      emit(AuthStatee(AuthStatus.failure));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Center(
            child: CustomText(
          text: 'Email already exist',
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
