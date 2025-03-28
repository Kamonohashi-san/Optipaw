import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';
import 'package:optipaw/model/image.dart';
import 'package:optipaw/utils/Utility.dart';

class HistoryDetail extends StatelessWidget {
  final Photos photo;

  const HistoryDetail({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Styles.iconColor),
        backgroundColor: Styles.colorPrimary,
        title: const Text('Detection Details', style: Styles.textHeader),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: DecorationImage(
                  image: MemoryImage(
                    Utility.dataFromBase64String(photo.photoName),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Disease:', photo.diseaseName),
                  const SizedBox(height: 12),
                  _buildDetailRow('Severity:', photo.severity),
                  const SizedBox(height: 12),
                  _buildDetailRow('Confidence:',
                      '${photo.confidence_level.toStringAsFixed(2)}%'),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                      'Date:', photo.createdAt.toString().split(' ')[0]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Styles.colorPrimary,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
