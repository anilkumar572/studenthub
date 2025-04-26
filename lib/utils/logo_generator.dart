import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class LogoGenerator {
  static Future<void> generateLogos() async {
    final Map<String, Color> techColors = {
      'flutter': const Color(0xFF02569B), // Flutter blue
      'web': const Color(0xFF4285F4), // Google blue
      'ml': const Color(0xFF4CAF50), // ML green
      'cloud': const Color(0xFF1976D2), // Cloud blue
      'blockchain': const Color(0xFFF57C00), // Blockchain orange
      'ios': const Color(0xFF000000), // iOS black
      'data': const Color(0xFF0097A7), // Data cyan
      'game': const Color(0xFFD32F2F), // Game red
      'security': const Color(0xFF455A64), // Security blue-grey
      'arvr': const Color(0xFF7B1FA2), // AR/VR purple
      'design': const Color(0xFFE91E63), // Design pink
      'backend': const Color(0xFF455A64), // Backend blue-grey
    };

    for (var entry in techColors.entries) {
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      final size = const Size(200, 200);
      final rect = Offset.zero & size;

      // Draw background
      final paint = Paint()
        ..color = entry.value
        ..style = PaintingStyle.fill;
      canvas.drawRect(rect, paint);

      // Draw text
      final textPainter = TextPainter(
        text: TextSpan(
          text: entry.key.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );

      textPainter.paint(
        canvas,
        Offset(
          (size.width - textPainter.width) / 2,
          (size.height - textPainter.height) / 2,
        ),
      );

      // Convert to image
      final picture = recorder.endRecording();
      final image = await picture.toImage(
        size.width.toInt(),
        size.height.toInt(),
      );
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        // TODO: Save the image to assets/logos/${entry.key}.png
      }
    }
  }
}
