import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

void main() async {
  // Create logos directory if it doesn't exist
  final logoDir = Directory('assets/logos');
  if (!await logoDir.exists()) {
    await logoDir.create(recursive: true);
  }

  final Map<String, Color> techColors = {
    'flutter': const Color(0xFF02569B),
    'web': const Color(0xFF4285F4),
    'ml': const Color(0xFF4CAF50),
    'cloud': const Color(0xFF1976D2),
    'blockchain': const Color(0xFFF57C00),
    'ios': const Color(0xFF000000),
    'data': const Color(0xFF0097A7),
    'game': const Color(0xFFD32F2F),
    'security': const Color(0xFF455A64),
    'arvr': const Color(0xFF7B1FA2),
    'design': const Color(0xFFE91E63),
    'backend': const Color(0xFF455A64),
  };

  for (var entry in techColors.entries) {
    final filePath = path.join(logoDir.path, '${entry.key}.png');
    final file = File(filePath);

    // Create a colored rectangle with text
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final size = const Size(200, 200);
    final rect = Offset.zero & size;

    // Draw background with gradient
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        entry.value,
        entry.value.withOpacity(0.8),
      ],
    );

    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );

    // Add pattern
    final patternPaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 1;

    for (double i = 0; i < size.width; i += 20.0) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        patternPaint,
      );
    }

    for (double i = 0; i < size.height; i += 20.0) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        patternPaint,
      );
    }

    // Draw text
    final textPainter = TextPainter(
      text: TextSpan(
        text: entry.key.toUpperCase(),
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(2, 2),
              blurRadius: 4,
            ),
          ],
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

    // Convert to image and save
    final picture = recorder.endRecording();
    final image = await picture.toImage(
      size.width.toInt(),
      size.height.toInt(),
    );
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      await file.writeAsBytes(
        byteData.buffer.asUint8List(
          byteData.offsetInBytes,
          byteData.lengthInBytes,
        ),
      );
      print('Generated logo: ${file.path}');
    }
  }

  print('All logos generated successfully!');
}
