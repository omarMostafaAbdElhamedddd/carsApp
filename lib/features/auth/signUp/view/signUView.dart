
import 'package:cars_app/features/auth/signUp/presenter/sign_up_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../conts.dart';
import '../../../../utitls/resposiveSize.dart';

import '../../../splashView/view/widgets/customText.dart';
import '../../signIn/views/widgets/customButton.dart';
import '../../signIn/views/widgets/customTextFormField.dart';




class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  void initState() {
  Future.delayed(Duration(seconds: 1));
    super.initState();
  }
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  bool secure  =false ;
  GlobalKey<FormState> globalKey = GlobalKey();
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
                    CustomVerticalSizeBox(padding: 1.3,),
                    Image.asset(logoWithKPrCokor),
                    CustomVerticalSizeBox(padding: .5,),
                    CustomText(text: 'Sign up' , fontSize: 30,fontWeight: FontWeight.bold,),
                    CustomVerticalSizeBox(padding: 1.2,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: CustomText(text:'Create an account by providing following details' ,height: 1.5,textAlign: TextAlign.center, maxLines: 2,fontSize: 18,),
                    ),
                    CustomVerticalSizeBox(),
                    CustomTextFormFiled(
                    
                        validator: (data){
                          if (data == null || data.isEmpty) {
                            return 'This field is required';
                          }
                          // Regular expression for email validation
                          final bool emailValid =
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(data);
                          if (!emailValid) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        
                      },
                      label: 'Enter your email',controller: controller1,),
                    CustomVerticalSizeBox(padding: .7,),
                    CustomTextFormFiled(
                      validator: (data){
                        if(data!.isEmpty){
                          return "This field is required";
                        }else{
                          return null;
                        }
                      },
                      label: 'Enter name',controller: controller2,),
                    CustomVerticalSizeBox(padding: .7,),
                    TextFormField(
                      validator: (data){
                        if(data!.length<6){
                          return "please enter strong passwrd";
                        }else{
                          return null ;
                        }
                      },
                      controller: controller3,
                      obscureText: secure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){
                              secure =!secure;
                              setState(() {
                                
                              },);
                              
                            },
                            icon:secure ? Icon(Icons.visibility_off_outlined,color: secondColor,):Icon(Icons.visibility_outlined , color: kPreimaryColor,),
                          ),
                          hintText: 'Enter passwod',
                          hintStyle: TextStyle(
                              fontSize: 12
                          ),

                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                            color: kPreimaryColor,
                          )),
                        )
                    ),
                    CustomVerticalSizeBox(padding: 1.5,),
                    CustomButton(text: 'Sign up' , onTap: () async {
                     if (globalKey.currentState!.validate()) {
                       await context.read<Sign_up_presenter>().registerUser(
                          controller1.text,
                          controller2.text,
                          controller3.text,
                          context,
                        );
                     }
                    },),
                    CustomVerticalSizeBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: 'You already have account ? ' , fontSize: 18,),
                        GestureDetector(
                            onTap: (){
                             Navigator.pop(context);
                            },
                            child: CustomText(text: 'Sign in ' , fontSize: 22,fontWeight: FontWeight.bold,textDecoration: TextDecoration.underline,))
                      ],
                    ),
                    CustomVerticalSizeBox(),


                  ],
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<Sign_up_presenter,AuthStatee>(builder: (c, state){
          if(state.status==AuthStatus.loading){
            return SpinKitCircle(
              color: kPreimaryColor,
              size: 50.0,
            );
          }else{
            return CustomText(text: '');
          }
        })
      ],
    );
  }
}
