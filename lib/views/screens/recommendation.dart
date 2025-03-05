import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';
import 'package:optipaw/views/screens/widget/recommendation_widget.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Styles.iconColor, //change your color here
        ),
        backgroundColor: Styles.colorPrimary,
        title: const Text(
          'Recommendation',
          style: Styles.textHeader,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: Styles.defPadding,
          child: Column(
            children: [
              recommendationCard(
                'Minor $label',
                [
                  "Observation and Monitoring: In cases where cataracts are small and not significantly affecting vision, your veterinarian may recommend simply monitoring the condition regularly to ensure it doesn't worsen rapidly.",
                  'Nutritional Supplements: Certain nutritional supplements containing antioxidants like vitamin E, vitamin C, and omega-3 fatty acids might be recommended to slow down cataract progression.',
                ],
              ),
              Styles.sizedBox,
              recommendationCard(
                'Major $label',
                [
                  "Surgical Intervention: Once cataracts start to impair vision significantly, surgery is often the recommended treatment. Phacoemulsification is the most common technique used, where the cloudy lens is broken up and removed, and an artificial intraocular lens (IOL) is implanted.",
                  'Pre-operative Care: Prior to surgery, your veterinarian may conduct pre-operative evaluations to ensure your dog is healthy enough for the procedure. This may involve blood tests, electrocardiograms (ECG), and other diagnostic tests.',
                  'Post-operative Care: Following surgery, your dog will require diligent post-operative care, including administering eye drops and medications as prescribed, limiting activity to prevent injury to the healing eye, and attending follow-up appointments with the veterinarian to monitor healing and address any concerns.',
                ],
              ),
              Styles.sizedBox,
              recommendationCard(
                'Critical $label',
                [
                  "Immediate Surgical Intervention: In cases where cataracts have progressed to the point of causing complete blindness or significant pain and discomfort, immediate surgical intervention may be necessary to alleviate suffering and restore vision.",
                  'Emergency Care: Critical cataracts may require urgent attention, and your veterinarian may prioritize surgery to address the condition promptly.',
                  'Intensive Post-operative Monitoring: After surgery, your dog may require more intensive post-operative monitoring and care to ensure proper healing and minimize complications.',
                ],
              ),
              Styles.sizedBox,
              const Text(
                  "Regardless of the severity, it's essential to work closely with your veterinarian to determine the most appropriate course of action for your dog's individual situation. They can provide tailored recommendations based on factors such as your dog's overall health, the extent of the cataracts, and your preferences as a pet owner.",
                  style: Styles.textRegular),
            ],
          ),
        ),
      ),
    );
  }
}
