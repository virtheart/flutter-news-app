import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CustomImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = url != null && url!.isNotEmpty 
      ? dotenv.env['BASE_URL']! + url! 
      : '';

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => Container(color: Colors.grey[300]),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}