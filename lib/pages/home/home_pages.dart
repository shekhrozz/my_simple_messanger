
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:my_simple_messanger/model/massage_model.dart';
import 'package:my_simple_messanger/pages/auth/sign_in/sign_in_view.dart';
import 'package:my_simple_messanger/services/fire_service.dart';

import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController messageController = TextEditingController();
  double? _currentPosition = 0;

  bool? isVisible = true;

  void logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const SignInView()),
            (route) => false);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  void get sendMessage async {
    try {
      final id = const Uuid().v1();
      MessageModel myMessage = MessageModel(
          id: id,
          text: messageController.text,
          publishedDate: DateTime.now(),
          userId: FirebaseAuth.instance.currentUser!.uid);

      final messageSend =
          await FireDatabaseService.sendMessage(messageModel: myMessage);
      if (messageSend!) {
        debugPrint('SEND');
        messageController.clear();
      }
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }

  final ScrollController? scrollController = ScrollController();

  void get listenScroll {
    try {
      scrollController!.addListener(listener);
    } catch (e) {
      log(e.toString());
    }
  }

  void listener() {
    if (scrollController!.position.pixels ==
        scrollController!.position.minScrollExtent) {
      isVisible = true;
      setState(() {});
    } else if (_currentPosition! > scrollController!.position.pixels) {
      isVisible = true;
      setState(() {});
    } else if (_currentPosition! < scrollController!.position.pixels) {
      isVisible = false;
      setState(() {});
    }

    _currentPosition = scrollController!.position.pixels;
    debugPrint(
        " current:::${_currentPosition.toString()}  scroll::${scrollController!.position.pixels}");
    setState(() {});
  }

  @override
  void initState() {
    listenScroll;
    super.initState();
  }

  @override
  void dispose() {
    scrollController!.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
              onPressed: () => logout(context), icon: const Icon(Icons.logout))
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FirestoreListView(
              shrinkWrap: true,
              controller: scrollController,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              query: FireDatabaseService.databaseFirestore
                  .collection('messages')
                  .orderBy('publishedDate', descending: false),
              loadingBuilder: (context) => const CupertinoActivityIndicator(),
              itemBuilder: (context, doc) {
                if (!doc.exists) {
                  return const Text('document not found');
                }
                MessageModel? message = MessageModel.fromJson(doc.data());
                return Align(
                  alignment:
                      message.userId == FirebaseAuth.instance.currentUser!.uid
                          ? FractionalOffset.centerRight
                          : FractionalOffset.centerLeft,
                  child: Card(
                    color:
                        message.userId == FirebaseAuth.instance.currentUser!.uid
                            ? Colors.blue
                            : Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(message.username ?? 'user'),
                          Text(message.text ?? 'text'),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 550),
              curve: Curves.easeIn,
              bottom: isVisible! ? 20 : -100,
              left: .0,
              right: .0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        flex: 8,
                        child: CupertinoTextField(
                          controller: messageController,
                          placeholder: 'send message',
                        )),
                    Expanded(
                        flex: 2,
                        child: IconButton(
                            onPressed: () => sendMessage,
                            icon: const Icon(Icons.send)))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}



// import 'dart:developer';


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutterfire_ui/firestore.dart';
// import 'package:my_simple_messanger/model/massage_model.dart';
// import 'package:my_simple_messanger/pages/auth/sign_in/sign_in_view.dart';
// import 'package:my_simple_messanger/services/fire_service.dart';
// import 'package:uuid/uuid.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final TextEditingController messageController=TextEditingController();
//   double? _currentPosition=0;
//   bool? isVisible=true;
//  void logout(BuildContext context)async{
//     try {
//       await FirebaseAuth.instance.signOut();
//       setState(() {
//         Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder:(context) => const SignInView(),),
//            (route) => false);
//       });
//     } catch (e) {
//       log(e.toString());
//     }
//   }
//   void get sendMessage async {
//     try {
//       final id=const Uuid().v1();
//       MessageModel myMessage=MessageModel(
//         id: id,
//         text: messageController.text,
//         publishedDate: DateTime.now(),
//         userId: FirebaseAuth.instance.currentUser!.uid);
 
//     final messageSend=await FireDatabaseService.sendMessage(
//       messageModel: myMessage);

//       if (messageSend!) {
//         debugPrint('SEND');
//         messageController.clear();
//       }

//     }on FirebaseException catch (e) {
//     log(e.toString());
//     }
//   }

//   final ScrollController? scrollController=ScrollController();

//   void get listenSroll{
//     try {
//       scrollController!.addListener(listener);
//     } catch (e) {
     
//       log(e.toString());
//     }
//   }

//   void listener(){
//     if (scrollController!.position.pixels==
//     scrollController!.position.minScrollExtent) {
//       isVisible=true;
//       setState(() {});
//     }else if(_currentPosition!>scrollController!.position.pixels){
//       isVisible=true;
//       setState(() {});
//     }else if(_currentPosition!<scrollController!.position.pixels){
//       isVisible=false;
//       setState(() {});
//     }
//     _currentPosition=scrollController!.position.pixels;
//     debugPrint(
//       "current:::${_currentPosition.toString()} scroll:: ${scrollController!.position.pixels}");
//       setState(() {});
//   }
//   @override
//   void initState() {
//     listenSroll;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     scrollController!.removeListener(listener);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat'),
//         actions: [
//           IconButton(
//             onPressed:() => logout(context),
//              icon: const Icon(Icons.logout)
//              ),
//         ],
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           FirestoreListView(
//             shrinkWrap: true,
//             controller: scrollController,
//             physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics(),
//             ),
//             query:FireDatabaseService.databaseFirestore
//             .collection('messages')
//             .orderBy('pulishedDate',descending: false),
//             loadingBuilder: (context) => const CupertinoActivityIndicator(), 
//             itemBuilder:(context, doc) {
//               if (!doc.exists) {
//                 return const Text('document not found');
//               }
//               MessageModel? message=MessageModel.fromJson(doc.data());
//               return Align(
//                 alignment: message.userId==FirebaseAuth.instance.currentUser!.uid?
//                 FractionalOffset.centerRight
//                 :FractionalOffset.centerLeft,
//                 child: Card(
//                   color: message.userId==FirebaseAuth.instance.currentUser!.uid?
//                   Colors.blue
//                   :Colors.green,
//                   child: Padding(padding:EdgeInsets.all(8),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(message.username??'user'),
//                       Text(message.text??'text')
//                     ],
//                   ),),
//                 ),
//               );
//             },)
//         ],
//       ),
//     );

    
//   }
// }