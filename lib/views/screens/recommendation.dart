import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';
import 'package:optipaw/views/screens/widget/Cataract_Recommendation.dart';
import 'package:optipaw/views/screens/widget/Conjunctivitis_Recommnedation.dart';
import 'package:optipaw/views/screens/widget/recommendation_widget.dart';

class Recommendation extends StatelessWidget {
  const Recommendation(
      {super.key, required this.label, required this.severity});

  final String label;
  final String severity;

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
              if (label == 'Cataract')
                if (severity == 'Minor')
                  minorCataract(
                    [
                      'Step 1: Medication and Supplementation',
                      'Step 2: Lifestyle Adjustments',
                      'Step 3: Regular Follow-Ups',
                    ],
                    [
                      'Apply Anti-inflammatory Eye Drops',
                      'Antioxidant Supplements',
                      'Create a Safe Environment',
                      'Monitor the Eyes Daily',
                      'Diet and Hydration',
                    ],
                    [
                      'Reduces inflammation and minimizes further damage.',
                      'Apply as prescribed (usually 2–3 times daily).',
                      'Helps slow the progression of cataracts.',
                      'Common antioxidants: Vitamins C and E, Lutein, Omega-3 fatty acids.',
                      'Remove obstacles to prevent injury.',
                      'Use brighter lights to help with reduced vision.',
                      'Check for signs of worsening cataracts, redness, or discharge.',
                      'Avoid exposure to irritants (dust, smoke, or harsh chemicals).',
                      'Maintain a healthy diet rich in antioxidants.',
                      'Schedule follow-up visits with the vet every 3–6 months to monitor progression.',
                      'Adjust medications or treatment plans as needed',
                    ],
                  )
                else if (severity == 'Major')
                  majorCataract(
                    [
                      'Step 1: Immediate Veterinary Consultation',
                      'Step 2: Pre-Surgical Preparation',
                      'Step 3: Surgical Treatment (Phacoemulsification)',
                      'Step 4: Post-Surgical Care',
                    ],
                    [
                      'Comprehensive Eye Exam: ',
                      'Control Inflammation:',
                      'Manage Underlying Conditions:',
                      'Phacoemulsification:',
                      'Duration:',
                      'Administer Eye Drops:',
                      'Use an Elizabethan Collar (Cone):',
                      'Limit Physical Activity:',
                      'Follow-Up Appointments:',
                    ],
                    [
                      'The vet will assess cataract and the overall eye health.',
                      'Anti-inflammatory and antibiotic eye drops for 1–2 weeks before surgery.',
                      'Stabilize diabetes or other health problems before proceeding with surgery',
                      'is the gold-standard procedure for removing cataracts.',
                      'Surgery typically takes 1–2 hours under general anesthesia.',
                      'Antibiotics, anti-inflammatories, and lubricants are essential for healing.',
                      'Prevents the dog from rubbing or scratching the eye.',
                      'No running, jumping, or rough play for at least 2–3 weeks.',
                      'Regular follow-ups are crucial to monitor healing and detect complications like glaucoma or retinal detachment.',
                    ],
                  )
                else
                  criticalCataract(
                    [
                      'Step  1: Immediate Veterinary Consultation',
                      'Step  1: Immediate Veterinary Consultation',
                      'Step  3: Surgical Intervention (Urgent Phacoemulsification)',
                      'Step  4: Post-Surgical Intensive Care',
                      'Step  5: Frequent Follow-Ups',
                      'Step  6: Long-Term Monitoring',
                    ],
                    [
                      'Symptoms: Total vision loss, fully opaque eyes, severe redness, swelling, or pain.',
                      'Emergency diagnostics: Eye ultrasound, bloodwork, and check for complications like glaucoma or retinal detachment',
                      'Control inflammation with high-dose anti-inflammatory eye drops.',
                      'Treat or manage secondary complications (e.g., glaucoma, diabetes).',
                      'Pain relief and antibiotics if infection is present.',
                      'Removal of the cataract and implantation of an artificial lens.',
                      'Surgery is urgent to prevent further damage or permanent blindness.',
                      'Administer medications (antibiotics, anti-inflammatories, pain relievers).',
                      'Use a cone to protect the eyes.',
                      'Strict rest and no physical activity for 3–4 weeks.',
                      'Monitor healing closely (first check-up after 24 hours, then weekly).',
                      'Check for complications (glaucoma, infection, corneal ulcers).',
                      'Regular eye exams every 3–6 months.'
                    ],
                  )
              else if (label == 'Conjunctivitis')
                if (severity == 'Minor')
                  minorConjunctivitis(
                    '1. Minor Severity (Mild Inflammation)',
                    [
                      '1.	Saline Rinse:',
                      '2.	Prescribed Eye Drops:',
                    ],
                    [
                      'Step 1: Diagnosis and Assessment',
                      'Step 2: Treatment',
                      'Step 3: Monitoring',
                    ],
                    [
                      'Veterinary examination to rule out infection, allergies, or foreign objects in the eye.',
                      'Clean the eye with sterile saline solution 2–3 times daily.',
                      'Lubricant drops to soothe irritation.',
                      'Antihistamine drops for allergies if recommended.',
                      'Improvement should occur within 3–5 days.',
                      'Improvement should occur within 3–5 days.',
                    ],
                  )
                else if (severity == 'Major')
                  majorConjunctivitis(
                    '2. Major Severity (Moderate to Severe Inflammation)',
                    [],
                    [
                      'Step 1: Veterinary Consultation',
                      'Step 2: Treatment',
                      'Step 3: Follow-Up and Monitoring',
                    ],
                    [
                      'The vet will perform tests to check for bacterial or viral infections, corneal ulcers, or underlying diseases.',
                      'ntibiotic or Antiviral Eye Drops (if infection is present).',
                      'nti-inflammatory Medications to reduce swelling and pain.',
                      'Elizabethan Collar (Cone) to prevent scratching and further irritation.',
                      'Return for a check-up after 5–7 days to ensure improvement.',
                      'Prolong treatment if needed, based on the vet’s advice.',
                    ],
                  )
                else
                  criticalConjunctivitis(
                    '3. Critical Severity (Severe and Potentially Vision-Threatening)',
                    [],
                    [
                      'Step 1: Emergency Veterinary Care',
                      'Step 2: Aggressive Treatment',
                      'Step 3: Intensive Care and Monitoring',
                    ],
                    [
                      'Immediate intervention is necessary to prevent permanent damage.',
                      'The vet will perform a full eye examination and may use diagnostic tools like fluorescein staining to check for ulcers or corneal damage.',
                      'High-Dose Antibiotic or Antiviral Therapy (administered multiple times a day).',
                      'Systemic Antibiotics or Steroids for severe inflammation.',
                      'Pain Management with oral medications.',
                      'Surgical Intervention may be required if there are complications (e.g., abscess, corneal perforation).',
                      'Frequent follow-ups (every 1–2 days initially).',
                      'Monitor for complications such as corneal ulcers, glaucoma, or permanent scarring.',
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
