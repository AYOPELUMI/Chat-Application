import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  static DBService instance = DBService();

  FirebaseFirestore _db = FirebaseFirestore.instance;

  String _userCollection = "Users";
  // String _conversationsCollection = "Conversations";

  Future<void> createUserInDB(
      {required String uid,
      required String name,
      required String email,
      required String imageURL,
      required String username}) async {
    try {
      return await _db.collection(_userCollection).doc(uid).set({
        "email": email,
        "image": imageURL,
        "lastSeen": DateTime.now().toUtc(),
        "username": username,
        "dob": "",
        "firstName": name.split(" ").first,
        "lastName": name.split(" ").last,
      });
    } catch (e) {
      log(e.toString());
    }
  }

  // Future<void> updateUserLastSeenTime(String _userID) {
  //   var _ref = _db.collection(_userCollection).document(_userID);
  //   return _ref.updateData({"lastSeen": Timestamp.now()});
  // }

  // Future<void> sendMessage(String _conversationID, Message _message) {
  //   var _ref =
  //       _db.collection(_conversationsCollection).document(_conversationID);
  //   var _messageType = "";
  //   switch (_message.type) {
  //     case MessageType.Text:
  //       _messageType = "text";
  //       break;
  //     case MessageType.Image:
  //       _messageType = "image";
  //       break;
  //     default:
  //   }
  //   return _ref.updateData({
  //     "messages": FieldValue.arrayUnion(
  //       [
  //         {
  //           "message": _message.content,
  //           "senderID": _message.senderID,
  //           "timestamp": _message.timestamp,
  //           "type": _messageType,
  //         },
  //       ],
  //     ),
  //   });
  // }

  // Future<void> createOrGetConversartion(String _currentID, String _recepientID,
  //     Future<void> _onSuccess(String _conversationID)) async {
  //   var _ref = _db.collection(_conversationsCollection);
  //   var _userConversationRef = _db
  //       .collection(_userCollection)
  //       .document(_currentID)
  //       .collection(_conversationsCollection);
  //   try {
  //     var conversation =
  //         await _userConversationRef.document(_recepientID).get();
  //     if (conversation.data != null) {
  //       return _onSuccess(conversation.data["conversationID"]);
  //     } else {
  //       var _conversationRef = _ref.document();
  //       await _conversationRef.setData(
  //         {
  //           "members": [_currentID, _recepientID],
  //           "ownerID": _currentID,
  //           'messages': [],
  //         },
  //       );
  //       return _onSuccess(_conversationRef.documentID);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Stream<Contact> getUserData(String _userID) {
  //   var _ref = _db.collection(_userCollection).document(_userID);
  //   return _ref.get().asStream().map((_snapshot) {
  //     return Contact.fromFirestore(_snapshot);
  //   });
  // }

  // Stream<List<ConversationSnippet>> getUserConversations(String _userID) {
  //   var _ref = _db
  //       .collection(_userCollection)
  //       .document(_userID)
  //       .collection(_conversationsCollection);
  //   return _ref.snapshots().map((_snapshot) {
  //     return _snapshot.documents.map((_doc) {
  //       return ConversationSnippet.fromFirestore(_doc);
  //     }).toList();
  //   });
  // }

  // Stream<List<Contact>> getUsersInDB(String _searchName) {
  //   var _ref = _db
  //       .collection(_userCollection)
  //       .where("name", isGreaterThanOrEqualTo: _searchName)
  //       .where("name", isLessThan: _searchName + 'z');
  //   return _ref.getDocuments().asStream().map((_snapshot) {
  //     return _snapshot.documents.map((_doc) {
  //       return Contact.fromFirestore(_doc);
  //     }).toList();
  //   });
  // }

  // Stream<Conversation> getConversation(String _conversationID) {
  //   var _ref =
  //       _db.collection(_conversationsCollection).document(_conversationID);
  //   return _ref.snapshots().map(
  //     (_doc) {
  //       return Conversation.fromFirestore(_doc);
  //     },
  //   );
  // }
}
