import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optipaw/constant/styles.dart';
import 'package:optipaw/utils/goto.dart';
import 'package:optipaw/views/Pages/widget/History_Detail.dart';
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
  DateTime? selectedDate;
  late List<Photos> filteredImages;

  @override
  void initState() {
    super.initState();
    images = [];
    filteredImages = [];
    dbHelper = DBHelper();
    refreshImages();
  }

  void filterByDate(DateTime? date) {
    setState(() {
      selectedDate = date;
      if (date == null) {
        filteredImages = List.from(images);
      } else {
        filteredImages = images
            .where((photo) =>
                photo.createdAt.year == date.year &&
                photo.createdAt.month == date.month &&
                photo.createdAt.day == date.day)
            .toList();
      }
    });
  }

  refreshImages() {
    dbHelper.getPhotos().then((imgs) {
      setState(() {
        images.clear();
        images.addAll(imgs);
        filteredImages = List.from(images);
      });
    });
  }

  Widget _buildDateFilter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.calendar_today),
            label: Text(
              selectedDate == null
                  ? 'Filter by Date'
                  : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
            ),
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                filterByDate(picked);
              }
            },
          ),
          if (selectedDate != null)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => filterByDate(null),
            ),
        ],
      ),
    );
  }

  gridView() => Padding(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: filteredImages.map((photo) {
            return GestureDetector(
              onTap: () {
                goToPage(
                  context,
                  HistoryDetail(photo: photo),
                  'fade',
                );
              },
              child: Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Utility.imageFromBase64String(photo.photoName),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Styles.colorPrimary.withOpacity(1.0),
                                Styles.colorPrimary.withOpacity(0.8),
                                Styles.colorSecondary.withOpacity(0.7),
                                Styles.colorSecondary.withOpacity(0.2),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                photo.createdAt.toString().split(' ')[0],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
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
            Container(
              child: _buildDateFilter(),
            ),
            Flexible(
              child: filteredImages.isEmpty
                  ? const Text('No images found for selected date')
                  : gridView(),
            ),
          ],
        ),
      ),
    );
  }
}
