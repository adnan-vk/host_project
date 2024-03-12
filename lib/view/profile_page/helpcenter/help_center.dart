// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const FAQItem(
            question: 'How do I create an account?',
            answer: 'To create an account, click on the "Sign Up" button...',
          ),
          const FAQItem(
            question: 'How can I track my order?',
            answer:
                'Once your order is shipped, you will receive a tracking number...',
          ),
          const FAQItem(
            question: 'What payment methods do you accept?',
            answer:
                'We accept credit/debit cards, PayPal, and bank transfers...',
          ),
          const SizedBox(height: 20),
          const Text(
            'Contact Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email: adnanvk12@gmail.com'),
            onTap: () {
              // _launchEmail('adnanvk12@gmail.com');
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Phone: +91 702 564 61 62'),
            onTap: () {
              launchPhone('+917025646162');
            },
          ),
        ],
      ),
    );
  }

  void launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  void launchPhone(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunch(phoneLaunchUri.toString())) {
      await launch(phoneLaunchUri.toString());
    } else {
      throw 'Could not launch $phoneLaunchUri';
    }
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      textColor: appcolor.orange,
      title: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
