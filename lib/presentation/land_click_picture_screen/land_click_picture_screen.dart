import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:keshav_alemeno/core/app_export.dart';
import 'package:keshav_alemeno/presentation/land_share_picture_screen/land_share_picture_screen.dart';
import 'package:keshav_alemeno/widgets/custom_icon_button.dart';

class LandClickPictureScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const LandClickPictureScreen({Key? key,required this.cameras}) : super(key: key);

  @override
  State<LandClickPictureScreen> createState() => _LandClickPictureScreenState();
}

class _LandClickPictureScreenState extends State<LandClickPictureScreen> {

  late CameraController _cameraController;

  Future initCamera(CameraDescription cameraDescription) async {
// create a CameraController
    _cameraController = CameraController(
        cameraDescription, ResolutionPreset.high);// Next, initialize the controller. This returns a Future.
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {return null;}
    if (_cameraController.value.isTakingPicture) {return null;}
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => LandSharePictureScreen(
            picture: picture,
          )));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    // initialize the rear camera
    initCamera(widget.cameras![0]);
  }


  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
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
                                alignment: Alignment.bottomCenter),
                            CustomIconButton(
                                height: 40.adaptSize,
                                width: 40.adaptSize,
                                margin: EdgeInsets.only(left: 24.h, top: 24.v),
                                padding: EdgeInsets.all(9.h),
                                alignment: Alignment.topLeft,
                                onTap: () {
                                  onTapBtnBackbuttonone(context);
                                },
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgBackbutton))
                          ]))),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.h, vertical: 15.v),
                          decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL40),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(
                                height: 302.v,
                                width: 310.h,
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text("Click your meal",
                                              style: theme
                                                  .textTheme.headlineSmall)),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgCutlery,
                                          height: 153.v,
                                          width: 310.h,
                                          alignment: Alignment.topCenter,
                                          margin: EdgeInsets.only(top: 65.v)),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgCorners,
                                          height: 207.v,
                                          width: 220.h,
                                          alignment: Alignment.topCenter,
                                          margin: EdgeInsets.only(top: 38.v)),
                                      Align(
                                          alignment: Alignment.topCenter,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 50.v),
                                        height: 200.adaptSize,
                                        width: 200.adaptSize,
                                        decoration: BoxDecoration(
                                            color: theme.colorScheme
                                                .secondaryContainer,
                                            borderRadius:
                                            BorderRadius.circular(
                                                141.h)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(141.h), // Same border radius as above
                                          child: _cameraController.value.isInitialized
                                              ? CameraPreview(_cameraController)
                                              : Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                      //     child: _cameraController.value.isInitialized?
                                      //     Container(
                                      //         margin: EdgeInsets.only(top: 50.v),
                                      //         height: 200.adaptSize,
                                      //         width: 200.adaptSize,
                                      //         decoration: BoxDecoration(
                                      //             color: theme.colorScheme
                                      //                 .secondaryContainer,
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     141.h)),
                                      //     // child: CameraPreview(_cameraController),
                                      //     )
                                      // :const Center(child:
                                      //     CircularProgressIndicator())
                                      )
                                    ])),
                            SizedBox(height: 10.v),
                            CustomIconButton(
                                height: 64.adaptSize,
                                width: 64.adaptSize,
                                padding: EdgeInsets.all(14.h),
                                decoration:
                                    IconButtonStyleHelper.outlineBlackCTL32,
                                onTap: () {
                                  takePicture();
                                  // onTapBtnCameraone(context);
                                },
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgCamera)),
                            SizedBox(height: 25.v)
                          ])))
                ]))));
  }

  /// Navigates to the landHomeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the landHomeScreen.
  onTapBtnBackbuttonone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.landHomeScreen);
  }

  /// Navigates to the landSharePictureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the landSharePictureScreen.
  onTapBtnCameraone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.landSharePictureScreen);
  }
}
