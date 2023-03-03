import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/global/model/available_women.dart';
import 'package:homezy/features/authentication/presentation/registration/widget/select_from_phone.dart';
import 'package:path_provider/path_provider.dart';

class CustomAvatarPickerBottomSheet extends StatefulWidget {
  const CustomAvatarPickerBottomSheet({
    super.key,
    required this.imageNotifier,
  });

  final ValueNotifier<File?> imageNotifier;

  @override
  State<CustomAvatarPickerBottomSheet> createState() =>
      _CustomerAvatarBottomSheetSheetState();
}

class _CustomerAvatarBottomSheetSheetState
    extends State<CustomAvatarPickerBottomSheet> {
  final List<String>? isChecked = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.75,
      decoration:  BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius:const  BorderRadius.only(
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
          const VerticalMargin(5),
          Text(
            'Select an Avatar',
            textAlign: TextAlign.center,
            style: Config.b2(context).copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const VerticalMargin(24),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                ...AvailableImages.availableImages.map((e) {
                  return GestureDetector(
                    onTap: () async {
                      await _uploadImage(e.imageUrl);
                    },
                    child: isChecked!.isEmpty
                        ? SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset(e.imageUrl),
                          )
                        : SizedBox(
                            height: 60,
                            width: 60,
                            child: Stack(
                              children: [
                                Image.asset(e.imageUrl),
                                if (e.imageUrl == isChecked!.single)
                                   Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 25,
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                                  )
                                else
                                  const SizedBox.shrink(),
                                if (e.imageUrl == isChecked!.single)
                                  Container(
                                    height: 75,
                                    width: 75,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                    ),
                                  )
                                else
                                  const SizedBox.shrink(),
                              ],
                            ),
                          ),
                  );
                }),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    showModalBottomSheet<File>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      elevation: 0,
                      builder: (context) {
                        return const SelectFromFile();
                      },
                    ).then((value) {
                      setState(() {
                        widget.imageNotifier.value = value;
                      });
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration:  BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child:  Icon(
                      Icons.add,
                      color: Theme.of(context).backgroundColor,
                      size: 38,
                    ),
                  ),
                )
              ],
            ),
          ),
          const VerticalMargin(20),
        ],
      ),
    );
  }

  _uploadImage(imageUrl) async {
    final bytes = await rootBundle.load(imageUrl);
    final image = bytes.buffer.asUint8List(
      bytes.offsetInBytes,
      bytes.lengthInBytes,
    );

    final tempDir = await getTemporaryDirectory();

    setState(
      () {
        if (!isChecked!.contains(imageUrl)) {
          isChecked!.clear();
          isChecked!.add(imageUrl);
          final name = imageUrl.split('/').last;
          final file = File('${tempDir.path}/$name');

          file.writeAsBytesSync(image);
          Navigator.of(context).pop(file);
        }
      },
    );
  }
}
