import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static removeEveryAndPush({required Widget screen}) =>
      navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen), (_) => true);
  static push({required Widget screen}) => navigatorKey.currentState
      ?.push(MaterialPageRoute(builder: (context) => screen));
}
