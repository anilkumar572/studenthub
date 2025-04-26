import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;

  const PlaceholderImage({
    super.key,
    required this.text,
    required this.color,
    this.width = 800,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
