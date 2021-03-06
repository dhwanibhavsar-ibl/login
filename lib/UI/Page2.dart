// import 'package:firebase_chat_example/api/firebase_api.dart';
// import 'package:firebase_chat_example/model/user.dart';
// import 'package:firebase_chat_example/widget/chat_body_widget.dart';
// import 'package:firebase_chat_example/widget/chat_header_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Firebase/firebase.dart';
import 'package:flutter_firebase/model/User.dart';
import 'package:flutter_firebase/model/message.dart';

import '../Utils.dart';
import 'chat_body.dart';

class ChatsPage extends StatefulWidget {
  ChatsPage({
    Key key,
  }) : super(key: key);

  //final store = FirebaseFirestore.instance.collection('users');
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage>
    with SingleTickerProviderStateMixin {
 
  String idUser;


  @override
  Widget build(BuildContext context) => StreamBuilder<List<UserModel>>(
        stream: FirebaseApi.getUsers(idUser),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text('Something Went Wrong Try later'));
              } else {
                final users = snapshot.data;

                if (users.isEmpty) {
                  return Center(child: Text('No Users Found'));
                } else
                  return ChatBodyWidget(users: users);
              }
          }
        },
      );
      
}
