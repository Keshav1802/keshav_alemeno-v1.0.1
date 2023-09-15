import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:keshav_alemeno/core/app_export.dart';
import 'package:keshav_alemeno/widgets/custom_elevated_button.dart';

import '../land_click_picture_screen/land_click_picture_screen.dart';

class LandHomeScreen extends StatelessWidget {
  const LandHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    late List<CameraDescription> _cameras;
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 4,),
                      CustomElevatedButton(
                          width: 229.h,
                          text: "Share your meal",
                          onTap: () async {
                            await availableCameras().then(
                                  (value) => Navigator.push(
                                  context, MaterialPageRoute(
                                  builder: (_) => LandClickPictureScreen(cameras: value))
                              ),
                            );
                            onTapShareyourmeal(context);
                          }),
                      Spacer()
                    ]))));
  }

  /// Navigates to the landClickPictureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the landClickPictureScreen.
  onTapShareyourmeal(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.landClickPictureScreen);
  }
}
