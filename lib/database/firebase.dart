import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:momo/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;

enum QueryStatus { Successful, Failed }

class QueryResult<T> {
  QueryStatus? status;
  T? data;
  dynamic error;

  QueryResult({this.status, this.data, this.error});
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}

class FirebaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final usersRef = FirebaseFirestore.instance
      .collection('momodatabase')
      .withConverter<User>(
    fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
    toFirestore: (user, _) => user.toJson(),
  );

  Future<QueryResult<User>?> getUser({required String phoneNumber}) async {
    QueryResult<User>? result;

    //
    return await usersRef
        .where("number", isEqualTo: phoneNumber)
        .get()
        .then((snapshot) {
      var userSnapShot = snapshot.docs;

      User? data;
      if (userSnapShot.isNotEmpty) {
        data = userSnapShot.first.data();
        data.id = userSnapShot.first.id;
      }

      var status = QueryStatus.Successful;

      result = QueryResult(
        status: status,
        data: data,
      );
      return result;
    }).catchError((error) {
      if (kDebugMode) {
        print("Failed to get user: $error");
      }
      var status = QueryStatus.Failed;
      var errorMsg = error;

      result = QueryResult(status: status, error: errorMsg);

      return result;
    });

    // User? user = userSnapShot.first.data();

    // return result;
  }

  Future<QueryResult<User>?>? saveUser({required User user}) async {
    QueryResult<User>? result;

    //
    await usersRef.add(user).then((value) {
      result = QueryResult(status: QueryStatus.Successful);
    }).catchError((error) {
      if (kDebugMode) {
        print("Failed to add user: $error");
      }
      result?.status = QueryStatus.Failed;
      result?.error = error;
    });

    return result;
  }

  Future<QueryResult<User>?> updateUser({required User user}) async {
    QueryResult<User>? result;

    //
    await usersRef.doc(user.id).update(user.toJson()).then((value) {
      result = QueryResult(status: QueryStatus.Successful);
    }).catchError((error) {
      if (kDebugMode) {
        print("Failed to update user: $error");
      }
      result?.status = QueryStatus.Failed;
      result?.error = error;
    });

    return result;
  }
}

// class FirebaseAppCheckHelper {
//   FirebaseAppCheckHelper._();
//
//   static Future initialise() async {
//     await FirebaseAppCheck.instance.activate(
//       webRecaptchaSiteKey: 'recaptcha-v3-site-key',
//       androidProvider: _androidProvider(),
//     );
//   }
//
//   static AndroidProvider _androidProvider() {
//     if (kDebugMode) {
//       return AndroidProvider.debug;
//     }
//
//     return AndroidProvider.playIntegrity;
//   }
// }
