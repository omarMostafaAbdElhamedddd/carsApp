import 'package:cars_app/conts.dart';
import 'package:cars_app/features/auth/signIn/presenter/sign_in_presenter.dart';
import 'package:cars_app/features/auth/signIn/views/widgets/customButton.dart';
import 'package:cars_app/features/auth/signIn/views/widgets/customTextFormField.dart';

import 'package:cars_app/utitls/resposiveSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../splashView/view/widgets/customText.dart';
import '../../signUp/view/signUView.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();

  bool secure = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Form(
            key: globalKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomVerticalSizeBox(
                      padding: 1.2,
                    ),
                    Image.asset(logoWithKPrCokor),
                    CustomVerticalSizeBox(
                      padding: .5,
                    ),
                    CustomText(
                      text: 'Sign in',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomVerticalSizeBox(
                      padding: 1.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: CustomText(
                        text: 'Please enter the account information to Sign in',
                        height: 1.5,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        fontSize: 18,
                      ),
                    ),
                    CustomVerticalSizeBox(),
                    CustomTextFormFiled(
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'This field is required';
                        }
                        // Regular expression for email validation
                        final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(data);
                        if (!emailValid) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      label: 'Enter your email',
                      controller: controller1,
                    ),
                    CustomVerticalSizeBox(
                      padding: .7,
                    ),
                    TextFormField(
                        obscureText: secure,
                        validator: (data) {
                           if(data!.length<6){
                             return "please strong password";
                           }else{
                             return null;
                           }
                        },
                        controller: controller2,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              secure = !secure;

                              setState(() {});
                            },
                            icon: secure
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                    color: secondColor,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: kPreimaryColor,
                                  ),
                          ),
                          hintText: 'Enter passwod',
                          hintStyle: TextStyle(fontSize: 12),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: kPreimaryColor,
                          )),
                        )),
                    CustomVerticalSizeBox(
                      padding: 1.5,
                    ),
                    CustomButton(
                      text: 'Sign in',
                      onTap: () async {
                        if (globalKey.currentState!.validate()) {
                          await context
                              .read<Sign_in_preseter>()
                              .login(controller1.text, controller2.text, context);
                        }
                      },
                    ),
                    CustomVerticalSizeBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'You do not have account ? ',
                          fontSize: 18,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => SignUpView(),
                                  transition: Transition.rightToLeft);
                            },
                            child: CustomText(
                              text: 'Sign up ',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textDecoration: TextDecoration.underline,
                            ))
                      ],
                    ),
                    CustomVerticalSizeBox(
                      padding: .7,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<Sign_in_preseter, AuthStatee>(builder: (c, state) {
          if (state.status == AuthStatus.loading) {
            return SpinKitCircle(
              color: kPreimaryColor,
              size: 50.0,
            );
          } else {
            return CustomText(text: '');
          }
        })
      ],
    );
  }
}
