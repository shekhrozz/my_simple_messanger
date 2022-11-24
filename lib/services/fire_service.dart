
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_simple_messanger/model/massage_model.dart';
import 'package:my_simple_messanger/model/user_model.dart';

class FireDatabaseService {
  static final FirebaseFirestore _databaseFirestore=
  FirebaseFirestore.instance;
  static Future<bool?>saveUserToCollection({
    required UserModel user})async{
      bool userSaved=false;
      try {
        await _databaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toJson());
        userSaved=true;
        return userSaved;
      } catch (e) {
        log(e.toString());
      }
      return userSaved;
    }
    static Future<bool?>sendMessage({required MessageModel messageModel})async{
      bool? messageCreated=false;
      try {
        final userDocument=await _databaseFirestore
        .collection('users')
        .doc(messageModel.userId)
        .get();

        final UserModel user=UserModel.fromJson(userDocument.data()!);
        messageModel=messageModel.copyWith(username: user.userName);
        await _databaseFirestore
        .collection('messages')
        .doc(messageModel.id)
        .set(messageModel.toJson());
        messageCreated=true;
        return messageCreated;
      } catch (e) {
        log(e.toString());
      }
      return messageCreated;
    }
    static FirebaseFirestore get databaseFirestore=>_databaseFirestore;
}