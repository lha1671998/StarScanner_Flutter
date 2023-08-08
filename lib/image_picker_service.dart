import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_scanner/utils/app_colors.dart';

class ImagePickerService {
  Future<XFile?> pickCropImage({required ImageSource imageSource}) async {
    XFile? pickImage = await ImagePicker().pickImage(source: imageSource);
    if (pickImage == null) return null;

    CroppedFile? croppedFile = await ImageCropper()
        .cropImage(sourcePath: pickImage!.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ], uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          statusBarColor: AppColors.tealPrimary ,
          activeControlsWidgetColor: AppColors.tealPrimary,
          toolbarColor: AppColors.tealPrimary,
          toolbarWidgetColor: AppColors.white,
          cropFrameColor: AppColors.tealPrimary ,
          cropGridColor: AppColors.tealPrimary,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        minimumAspectRatio: 1.0,
      )
    ]);

    if (croppedFile == null) return null;

    return XFile(croppedFile.path);
  }
}
