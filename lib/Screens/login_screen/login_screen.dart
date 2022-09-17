import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/Screens/login_screen/cubit/shop_login_cubit.dart';
import 'package:e_commerce/Screens/login_screen/cubit/shop_login_state.dart';
import 'package:e_commerce/shared/components/CustomToast.dart';
import 'package:e_commerce/shared/components/default_button.dart';
import 'package:e_commerce/shared/components/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);


  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if(state is ShopLoginErrorState){
            CustomToast.showToast(msg: state!.error!, color: Colors.redAccent);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
                    Text('Login',style: Theme.of(context).textTheme.headline5,),
                    SizedBox(height: 1.h,),
                    Text('Login now to browse products',style: Theme.of(context).textTheme.subtitle2,),
                    SizedBox(height: 4.h,),
                    DefaultTextField(
                      controller: emailController,
                      validate: (value) {
                        if(value!.isEmpty) {
                          return 'email is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'email',
                      hintText: 'Enter valid email',
                    ),
                    SizedBox(height: 2.h,),
                    DefaultTextField(
                      controller: passwordController,
                      validate: (value) {
                        if(value!.isEmpty) {
                          return 'password is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'password',
                      isPassword: true,
                      hintText: 'Enter your password',
                    ),
                    SizedBox(height:4.h),
                    ConditionalBuilder(
                      condition: state is! ShopLoginLoadingState,
                      builder:(context)=> DefaultButton(
                          onPressed: (){
                            print('pressed');
                            if(formKey.currentState !=null && formKey.currentState!.validate()){
                              print('entered');
                              ShopLoginCubit.get(context).loginApiCall(email: emailController.text, password: passwordController.text);
                            }
                          }, text: 'Login'),
                      fallback: (BuildContext context) => const Center(child: CircularProgressIndicator(),),),

                    SizedBox(height: 2.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have account?',style: Theme.of(context).textTheme.bodyText2,),
                        TextButton(
                            onPressed: (){},
                            style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: const EdgeInsetsDirectional.only(start: 2),

                            ),
                            child: const Text('REGISTER',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w500),))
                      ],
                    )


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

