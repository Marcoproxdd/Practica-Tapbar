import 'package:flutter/material.dart';
import 'dart:math';

class ImageTab extends StatefulWidget {
  @override
  _ImageTabState createState() => _ImageTabState();
}

class _ImageTabState extends State<ImageTab> {
  Random _random = Random();
  late String _imageUrl;

  @override
  void initState() {
    super.initState();
    _imageUrl = _generateRandomImageUrl();
  }

  String _generateRandomImageUrl() {
    int width = 200 + _random.nextInt(100);
    int height = 200 + _random.nextInt(100);
    return 'https://picsum.photos/$width/$height';
  }

  void _updateImage() {
    setState(() {
      _imageUrl = _generateRandomImageUrl();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        _updateImage();
      },
      child: Center(
        child: Image.network(_imageUrl),
      ),
    );
  }
}
