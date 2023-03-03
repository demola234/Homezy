import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ImgPickerService {
  ImgPickerService({
    required ImagePicker imagePicker,
    required FilePicker filePicker,
  })  : _imagePicker = imagePicker,
        _filePicker = filePicker;

  factory ImgPickerService.initialize() {
    return ImgPickerService(
      imagePicker: ImagePicker(),
      filePicker: FilePicker.platform,
    );
  }

  final ImagePicker _imagePicker;
  final FilePicker _filePicker;
  bool hasImage = false;
  File? image;

  Future getImage(ImageSource source) async {
    try {
      final image = await _imagePicker.pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);

      return imageTemporary;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }
}

class Failure {
  Failure(this.message);

  final String message;
}
