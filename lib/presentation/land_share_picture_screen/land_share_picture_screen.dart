import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:keshav_alemeno/core/app_export.dart';
import 'package:keshav_alemeno/widgets/custom_icon_button.dart';

import '../../main.dart';
import '../message_screen/message_screen.dart';

class LandSharePictureScreen extends StatefulWidget {
  final XFile picture;
  const LandSharePictureScreen({Key? key,required this.picture}) : super(key: key);

  @override
  State<LandSharePictureScreen> createState() => _LandSharePictureScreenState();
}

class _LandSharePictureScreenState extends State<LandSharePictureScreen> {

  final Reference storageReference = FirebaseStorage.instance.ref().child('images');
  Future<void> uploadImage(XFile xFile) async {
    try {
      File imageFile = File(xFile.path);
      // Create a unique filename for the uploaded image
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Upload the image to Firebase Storage
      TaskSnapshot taskSnapshot = await storageReference.child(fileName).putFile(imageFile);

      // Get the download URL for the uploaded image
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      // Use imageUrl as needed (e.g., store it in Firestore, display it in the app)
      print('Image uploaded successfully. Download URL: $imageUrl');

      Navigator.push(
          context, MaterialPageRoute(
          builder: (_) => MessageScreen())
      );
      showNotification();

    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      '194',
      'Keshav_Alemeno',
      channelDescription: 'Demo App',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Image Has Been Successfully Uploaded',
      '',
      platformChannelSpecifics,
    );
  }



  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                height: mediaQueryData.size.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                          height: 392.v,
                          width: double.maxFinite,
                          child: Stack(alignment: Alignment.topLeft, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgBabys,
                                margin: EdgeInsets.only( top: 80.v),
                                height: 392.v,
                                width: 360.h,
                                alignment: Alignment.center),
                            CustomIconButton(
                                height: 40.adaptSize,
                                width: 40.adaptSize,
                                margin: EdgeInsets.only(left: 24.h, top: 24.v),
                                padding: EdgeInsets.all(9.h),
                                alignment: Alignment.topLeft,
                                onTap: () {
                                  onTapBtnBackarrowone(context);
                                },
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgBackbutton))
                          ]))),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 38.h, vertical: 15.v),
                          decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL40),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(
                                height: 302.v,
                                width: 283.h,
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text("Will you eat this?",
                                              style: theme
                                                  .textTheme.headlineSmall)),
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: SizedBox(
                                              height: 283.adaptSize,
                                              width: 283.adaptSize,
                                              child: Stack(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .center,
                                                        child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        45.h),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    6.h),
                                                            decoration: AppDecoration
                                                                .fillBlueGray
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder95),
                                                            child: CustomImageView(
                                                                svgPath: ImageConstant
                                                                    .imgVector,
                                                                height: 109.v,
                                                                width: 115.h))),
                                                    // CustomImageView(
                                                    //     file: File(widget.picture.path),
                                                    //     height: 199.v,
                                                    //     width: 175.h,
                                                    //     alignment: Alignment
                                                    //         .centerRight,
                                                    //     margin: EdgeInsets.only(
                                                    //         right: 41.h)),
                                                    CustomImageView(
                                                      radius:  BorderRadius.circular(
                                                          141.h),
                                                        file: File(widget.picture.path),
                                                        height: 283.adaptSize,
                                                        width: 283.adaptSize,
                                                        alignment:
                                                            Alignment.center)
                                                  ])))
                                    ])),
                            SizedBox(height: 10.v),
                            CustomIconButton(
                              onTap: (){
                                if (widget.picture!= null) {
                                  uploadImage(widget.picture);
                                }
                              },
                                height: 64.adaptSize,
                                width: 64.adaptSize,
                                padding: EdgeInsets.all(15.h),
                                decoration:
                                    IconButtonStyleHelper.outlineBlackCTL32,
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgCheckmark)),
                            SizedBox(height: 25.v)
                          ])))
                ]))));
  }

  /// Navigates to the landClickPictureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the landClickPictureScreen.
  onTapBtnBackarrowone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.landClickPictureScreen);
  }
}
