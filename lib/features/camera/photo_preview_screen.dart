import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';

class PhotoPreviewScreen extends StatefulWidget {
  final XFile photo;
  final bool isPicked;
  final Function() onSave;

  const PhotoPreviewScreen({
    super.key,
    required this.photo,
    required this.isPicked,
    required this.onSave,
  });

  @override
  State<PhotoPreviewScreen> createState() => _PhotoPreviewScreenState();
}

class _PhotoPreviewScreenState extends State<PhotoPreviewScreen> {
  bool _savedPhoto = false;

  Future<void> _saveToGallery() async {
    if (_savedPhoto) return;
    await GallerySaver.saveImage(widget.photo.path, albumName: 'Thread Clone');
    _savedPhoto = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Preview photo',
        ),
        actions: [
          if (!widget.isPicked)
            IconButton(
              onPressed: _saveToGallery,
              icon: FaIcon(
                _savedPhoto
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.download,
              ),
            ),
          IconButton(
            onPressed: () {
              widget.onSave();
              Navigator.pop(context, widget.photo.path);
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowRight,
            ),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Image.file(
          File(widget.photo.path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
