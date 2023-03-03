import 'dart:convert';

import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'package:instagram/data/models/child_classes/notification.dart';
import 'package:instagram/data/models/parent_classes/without_sub_classes/push_notification.dart';

class DeviceNotification {
  static Future<void> pushNotification(
      {required CustomNotification customNotification,
      required String token}) async {
    String notificationRoute;
    String routeParameterId;
    if (customNotification.isThatPost) {
      notificationRoute = "post";
      routeParameterId = customNotification.postId;
    } else {
      notificationRoute = "profile";
      routeParameterId = customNotification.senderId;
    }
    PushNotification detail = PushNotification(
      title: customNotification.senderName,
      body: customNotification.text,
      deviceToken: token,
      notificationRoute: notificationRoute,
      routeParameterId: routeParameterId,

      /// to avoid errors
      isThatGroupChat: false,
      userCallingId: "",
    );
    return await sendPopupNotification(pushNotification: detail);
  }

  static Future<void> sendPopupNotification(
      {required PushNotification pushNotification}) async {
    try {
      try {
        await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json',

            /// conect with cloud messaging and get server key from project settings here
            /// replace the points with your key  "key=...." and set it in [notificationKey]
            'Authorization':
                'key=AAAAabq4C6U:APA91bGSjQnzhS-4iG9w1_G9aiOO1osHnnMrJFB7kKqh8D6QN0cDMtKO22kDKtI2z7cS9HxUl80GpsOW2qonqkEvnqCK1Kyd9mRFImnetVmkSGBUyTTd0YL-j5U3T_PprdjA7MzbEPd5',
          },
          body: jsonEncode(pushNotification.toMap()),
        );
      } catch (e, s) {
        if (kDebugMode) print(s);
      }
    } catch (e) {
      return Future.error("Error with push notification");
    }
  }
}
