import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_simple_messanger/model/user_model.dart';
import 'package:my_simple_messanger/pages/auth/sign_in/sign_in_view.dart';
import 'package:my_simple_messanger/pages/home/home_pages.dart';
import 'package:my_simple_messanger/services/fire_service.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController controllerUsername=TextEditingController();
  TextEditingController controllerEmail=TextEditingController();
  TextEditingController controllerPassword=TextEditingController();
  TextEditingController controllerConfirmation=TextEditingController();

  void get signUp async{
    try {
      if (controllerEmail.text.isEmpty||
           controllerPassword.text.isEmpty||   
           controllerUsername.text.isEmpty||
           controllerConfirmation.text.isEmpty
            ) {
        return;
      }
      if (controllerConfirmation.text!=controllerPassword.text) {
        return;
      }
      final UserCredential credential=await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
        email:controllerEmail.text,
         password:controllerPassword.text);
         assert(credential.user!=null);

         UserModel? userModel=UserModel(
          id: credential.user!.uid,
          userName: controllerUsername.text,
          userCreatedDate: DateTime.now(),
          email: controllerEmail.text,
          password: controllerPassword.text);

          final userSavedToDatabase=
          await FireDatabaseService.saveUserToCollection(user: userModel);
          if (credential.user!=null&&userSavedToDatabase!) {
            setState(() {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder:(context) => HomePage(),), (route) => false);
            });
          }
    } catch (e) {
      log(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controllerUsername,
              decoration: const InputDecoration(hintText: 'username'),
            ),
              TextField(
              controller:controllerEmail,
              decoration: const InputDecoration(hintText: 'email'),
            ),
              TextField(
              controller: controllerPassword,
              decoration: const InputDecoration(hintText: 'password'),
            ),
              TextField(
              controller: controllerConfirmation,
              decoration: const InputDecoration(hintText: 'confirmation'),
            ),
            CupertinoButton(
              child:const Text('sign up'),
               onPressed:() => signUp,),
               CupertinoButton(
                child:const Text('sign in'),
                 onPressed:() {
                   Navigator.of(context).push(
                    MaterialPageRoute(builder:(context) => SignInView(),));
                 },)
          ],
        ),
      ),
    );
  }
}