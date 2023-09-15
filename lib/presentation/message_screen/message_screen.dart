import 'package:flutter/material.dart';
import 'package:keshav_alemeno/core/app_export.dart';

import '../land_home_screen/land_home_screen.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () { // this is the block you need
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LandHomeScreen()), (route) => false);
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 51.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 1.v),
                Text(
                  "GOOD JOB",
                  style: theme.textTheme.displayMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
