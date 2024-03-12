import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy and Security'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Information Collected'),
          _buildSectionContent(
              'Describe the types of information you collect from users, such as personal information (name, email address, etc.), payment information, and any other data collected through the app or website.'),
          _buildSectionTitle('How Information is Used'),
          _buildSectionContent(
              'Explain how you use the information collected from users. For example, you might use personal information to process orders, communicate with customers, provide customer support, and improve your services.'),
          _buildSectionTitle('Data Sharing'),
          _buildSectionContent(
              'Describe whether you share users\' information with third parties, such as payment processors, shipping companies, or marketing partners. If you do share data with third parties, explain the purposes for which it\'s shared and how it\'s protected.'),
          _buildSectionTitle('Security Measures'),
          _buildSectionContent(
              'Outline the security measures you have in place to protect users\' personal information from unauthorized access, disclosure, alteration, and destruction.'),
          _buildSectionTitle('Cookies and Tracking Technologies'),
          _buildSectionContent(
              'Explain whether you use cookies or other tracking technologies to collect information about users\' browsing behavior and preferences. Describe how users can manage or opt-out of tracking.'),
          _buildSectionTitle('User Choices and Controls'),
          _buildSectionContent(
              'Explain how users can access, update, or delete their personal information, as well as how they can opt-out of certain data collection or processing activities.'),
          _buildSectionTitle('Legal Basis for Processing'),
          _buildSectionContent(
              'If applicable, explain the legal basis for processing users\' personal information, such as consent, contractual necessity, legitimate interests, or compliance with legal obligations.'),
          _buildSectionTitle('Children\'s Privacy'),
          _buildSectionContent(
              'If your app is directed at children under the age of 13 (or a different age depending on applicable laws), explain how you comply with children\'s privacy laws, such as the Children\'s Online Privacy Protection Act (COPPA).'),
          _buildSectionTitle('Changes to the Privacy Policy'),
          _buildSectionContent(
              'Explain how you will notify users of any changes to the privacy policy and when the changes will take effect.'),
          _buildSectionTitle('Contact Information'),
          _buildSectionContent(
              'Provide contact information for users to reach out with questions, concerns, or requests regarding their privacy.'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(content),
    );
  }
}
