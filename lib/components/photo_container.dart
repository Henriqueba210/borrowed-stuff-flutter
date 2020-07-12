import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoContainer extends StatefulWidget {
  final double height;
  final Function(String) onChanged;
  final String initialPhotoPath;

  PhotoContainer({this.initialPhotoPath, this.height = 180.0, this.onChanged});

  @override
  _PhotoContainerState createState() => _PhotoContainerState();
}

class _PhotoContainerState extends State<PhotoContainer> {
  PickedFile _image;

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      if (widget.onChanged != null) {
        widget.onChanged(image?.path ?? '');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialPhotoPath != null)
      _image = PickedFile(widget.initialPhotoPath);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: getImage,
        child: Container(
          height: widget.height,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black38,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: _image == null
                  ? Text('Sem foto.')
                  : DecorationImage(image: FileImage(File(_image.path))),
            ),
          ),
        ),
      ),
    );
  }
}
