import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() async {
  final List<Map<String, dynamic>> images = [
    {'name': 'job1', 'text': 'Tech Job', 'color': Colors.blue},
    {'name': 'job2', 'text': 'Design Job', 'color': Colors.green},
    {'name': 'job3', 'text': 'Backend Job', 'color': Colors.orange},
    {'name': 'resource1', 'text': 'Flutter Docs', 'color': Colors.purple},
    {'name': 'resource2', 'text': 'Dart Guide', 'color': Colors.cyan},
    {'name': 'resource3', 'text': 'Widgets', 'color': Colors.indigo},
    {'name': 'event1', 'text': 'Tech Conference', 'color': Colors.pink},
    {'name': 'event2', 'text': 'Career Fair', 'color': Colors.teal},
    {'name': 'event3', 'text': 'Workshop', 'color': Colors.deepPurple},
    {'name': 'college1', 'text': 'Stanford', 'color': Colors.brown},
    {'name': 'college2', 'text': 'MIT', 'color': Colors.blueGrey},
    {'name': 'college3', 'text': 'Harvard', 'color': Colors.grey},
  ];

  for (var image in images) {
    await generatePlaceholder(
      image['name'] as String,
      image['text'] as String,
      image['color'] as Color,
    );
  }
}

Future<void> generatePlaceholder(String name, String text, Color color) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(800, 400);

  // Draw background
  final paint = Paint()
    ..color = color
    ..style = PaintingStyle.fill;
  canvas.drawRect(Offset.zero & size, paint);

  // Draw text
  final textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
    ),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout();
  textPainter.paint(
    canvas,
    Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    ),
  );

  final picture = recorder.endRecording();
  final img = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final buffer = byteData!.buffer;
  final file = File('assets/images/$name.png');
  await file.writeAsBytes(
    buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
  );
}
