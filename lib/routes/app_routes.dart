import 'package:flutter/material.dart';
import 'package:keshav_alemeno/presentation/land_home_screen/land_home_screen.dart';
import 'package:keshav_alemeno/presentation/land_click_picture_screen/land_click_picture_screen.dart';
import 'package:keshav_alemeno/presentation/land_share_picture_screen/land_share_picture_screen.dart';
import 'package:keshav_alemeno/presentation/message_screen/message_screen.dart';
import 'package:keshav_alemeno/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String landHomeScreen = '/land_home_screen';

  static const String landClickPictureScreen = '/land_click_picture_screen';

  static const String landSharePictureScreen = '/land_share_picture_screen';

  static const String messageScreen = '/message_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    landHomeScreen: (context) => LandHomeScreen(),
    // landClickPictureScreen: (context) => LandClickPictureScreen(),
    // landSharePictureScreen: (context) => LandSharePictureScreen(),
    messageScreen: (context) => MessageScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
