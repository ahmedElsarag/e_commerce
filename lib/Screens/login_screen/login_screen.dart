import 'package:e_commerce/shared/components/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            Text('Login',style: Theme.of(context).textTheme.headline5,),
            SizedBox(height: 1.h,),
            Text('Login now to browse products',style: Theme.of(context).textTheme.subtitle2,),
            SizedBox(height: 2.h,),
            DefaultTextField(
              controller: emailController,
              validate: (value) {},
              keyboardType: TextInputType.emailAddress,
              labelText: 'email',
              hintText: 'Enter valid email',
            ),
            SizedBox(height: 1.h,),
            DefaultTextField(
              controller: emailController,
              validate: (value) {},
              keyboardType: TextInputType.emailAddress,
              labelText: 'email',
              isPassword: true,
              hintText: 'Enter valid email',
            )

          ],
        ),
      ),
    );
  }
}
