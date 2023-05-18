import "package:flutter/material.dart";
import 'package:image_network/image_network.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FirebaseImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  FirebaseImage({required this.imageUrl,  this.width = 100.0,  this.height = 100.0});

  @override
  Widget build(BuildContext context) {
    // return Image(
    //   image: NetworkImage(imageUrl), //Downloads the first time and retrieves the images from Cache the rest of the time.
    //   width: width,
    //   height: height,
    //   fit: BoxFit.cover,
    // );

    return ImageNetwork(
      image: imageUrl,
      imageCache: CachedNetworkImageProvider(imageUrl),
      height: 150,
      width: 150,
      duration: 1500,
      curve: Curves.easeIn,
      onPointer: true,
      debugPrint: false,
      fullScreen: false,
      fitAndroidIos: BoxFit.cover,
      borderRadius: BorderRadius.circular(70),
      onLoading: const CircularProgressIndicator(
        color: Colors.indigoAccent,
      ),
      onError: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      onTap: () {
        debugPrint("©gabriel_patrick_souza");
      },
    );
  }
}