
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homezy/core/global/constants/app_icons.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/utils/image_service.dart';
import 'package:image_picker/image_picker.dart';


class SelectFromFile extends StatefulWidget {
  const SelectFromFile({super.key});

  @override
  State<SelectFromFile> createState() => _SelectFromFileState();
}

class _SelectFromFileState extends State<SelectFromFile> {

    final ImgPickerService _imgPickerService = ImgPickerService.initialize();
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.75,
      decoration:  BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3E9F2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            const VerticalMargin(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final result =
                          _imgPickerService.getImage(ImageSource.camera);

                      result.then((value) => value);
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(AppIcons.camera),
                        Text(
                          'Camera',
                          style: Config.b3(context),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final result =
                          _imgPickerService.getImage(ImageSource.gallery);

                      result.then((value) {
                        value;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(AppIcons.gallery),
                        Text(
                          'Gallery',
                          style: Config.b3(context),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
    );
  }
}
