import 'package:homezy/core/global/constants/app_images.dart';

class AvailableImages {
  AvailableImages({
    required this.imageUrl,
  });
  late final String imageUrl;

  static final List<AvailableImages> availableImages = [
    AvailableImages(
      imageUrl: AppImages.avatar1,
    ),
    AvailableImages(
      imageUrl: AppImages.avatar2,
    ),
    AvailableImages(
      imageUrl: AppImages.avatar3,
    ),
    AvailableImages(
      imageUrl: AppImages.avatar4,
    ),
    AvailableImages(
      imageUrl: AppImages.avatar5,
    ),
    AvailableImages(
      imageUrl: AppImages.avatar6,
    ),
    AvailableImages(
      imageUrl: AppImages.avatar7,
    ),
    AvailableImages(
      imageUrl: AppImages.avatar8,
    ),
    AvailableImages(
      imageUrl: AppImages.avatar9,
    ),
    AvailableImages(
      imageUrl: AppImages.avatar10,
    ),
    AvailableImages(
      imageUrl: AppImages.avatar11,
    ),
  ];
}
