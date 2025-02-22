import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optipaw/constant/styles.dart';
import 'dart:io';
import '../../utils/Utility.dart';
import '../../utils/DB_Helper.dart';
import '../../model/image.dart';
import 'dart:async';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late Future<File> imageFile;
  late Image image;
  late DBHelper dbHelper;
  late List<Photos> images;

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper();
    refreshImages();
  }

  refreshImages() {
    dbHelper.getPhotos().then((imgs) {
      setState(() {
        images.clear();
        images.addAll(imgs);
      });
    });
  }

  gridView() => Padding(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: images.map((photo) {
            return Utility.imageFromBase64String(photo.photoName);
          }).toList(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Styles.iconColor, //change your color here
        ),
        backgroundColor: Styles.colorPrimary,
        title: const Text(
          'Optipaw History',
          style: Styles.textHeader,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: gridView(),
            ),
          ],
        ),
      ),
    );
  }
}
