import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homezy/core/global/constants/app_images.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.fileImage,
    this.shape = BoxShape.circle,
    this.radius = 50.0,
    this.fit = BoxFit.fill,
    this.margin,
  });

  final String? imageUrl;
  final File? fileImage;
  final BoxShape shape;
  final double radius;
  final BoxFit fit;
  final EdgeInsetsGeometry? margin;

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      backgroundColor: Colors.transparent,
      child: widget.fileImage == null && widget.imageUrl!.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: widget.imageUrl!,
              width: widget.radius * 2,
              height: widget.radius * 2,
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) {
                Image.asset(
                  AppImages.emptyImage,
                  width: 118,
                  height: 118,
                  fit: BoxFit.fill,
                );
                if (kDebugMode) {
                  print(
                    '---cacheNetworkImage----url: $url -----error: $error ------',
                  );
                }
                return Image.asset(
                  AppImages.emptyImage,
                  fit: BoxFit.fill,
                );
              },
            )
          : widget.fileImage != null
              ? CircleAvatar(
                  radius: widget.radius,
                  backgroundColor: Colors.transparent,
                  backgroundImage: FileImage(
                    widget.fileImage!,
                  ),
                )
              : Image.asset(
                  AppImages.emptyImage,
                  width: 118,
                  height: 118,
                  fit: BoxFit.fill,
                ),
    );
  }
}
