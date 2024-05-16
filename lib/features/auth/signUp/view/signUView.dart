
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../conts.dart';
import '../../../../utitls/resposiveSize.dart';
import '../../../splashView/widgets/customText.dart';
import '../../manager/authLogic.dart';
import '../../signIn/presenation/widgets/customButton.dart';
import '../../signIn/presenation/widgets/customTextFormField.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  void initState()  async{
  Future.delayed(Duration(seconds: 1));
    super.initState();
  }
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  bool secure  =false ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
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
                  CustomTextFormFiled(label: 'Enter your email',controller: controller1,),
                  CustomVerticalSizeBox(padding: .7,),
                  CustomTextFormFiled(label: 'Enter name',controller: controller2,),
                  CustomVerticalSizeBox(padding: .7,),
                  TextFormField(
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
                   await context.read<Authh>().registerUser(
                      controller1.text,
                      controller2.text,
                      controller3.text,
                      context,
                    );
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
        BlocBuilder<Authh,AuthStatee>(builder: (c, state){
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
