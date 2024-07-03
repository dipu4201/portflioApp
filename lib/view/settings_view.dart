// lib/views/settings_view.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildSectionTitle('Account Settings'),
            // _buildSettingItem(
            //   context,
            //   icon: Icons.person,
            //   title: 'Profile',
            //   subtitle: 'Change your profile details',
            //   onTap: () {
            //     // Navigate to Profile Page
            //   },
            // ),
            // _buildSettingItem(
            //   context,
            //   icon: Icons.lock,
            //   title: 'Password',
            //   subtitle: 'Change your password',
            //   onTap: () {
            //     // Navigate to Change Password Page
            //   },
            // ),
            Divider(height: 32.0),
            _buildSectionTitle('Notifications'),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Email Notifications'),
              subtitle: Text('Receive email notifications'),
              value: true, // or some state variable
              onChanged: (bool value) {
                // Handle toggle
              },
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Push Notifications'),
              subtitle: Text('Receive push notifications'),
              value: false, // or some state variable
              onChanged: (bool value) {
                // Handle toggle
              },
            ),
            Divider(height: 32.0),
            _buildSectionTitle('Social Media'),
            _buildSettingItem(
              context,
              icon: FontAwesomeIcons.facebook,
              title: 'Facebook',
              onTap: () {
                // Navigate to Facebook settings
              },
              iconColor: Colors.blue,
            ),
            _buildSettingItem(
              context,
              icon: FontAwesomeIcons.github,
              title: 'GitHub',
              onTap: () {
                // Navigate to GitHub settings
              },
              iconColor: Colors.black,
            ),
            _buildSettingItem(
              context,
              icon: FontAwesomeIcons.instagram,
              title: 'Instagram',
              onTap: () {
                // Navigate to Instagram settings
              },
              iconColor: Colors.purple,
            ),
            Divider(height: 32.0),
            _buildSectionTitle('Support'),
            _buildSettingItem(
              context,
              icon: Icons.help,
              title: 'Help Center',
              subtitle: 'Get help and support',
              onTap: () {
                // Navigate to Help Center
              },
            ),
            _buildSettingItem(
              context,
              icon: Icons.feedback,
              title: 'Feedback',
              subtitle: 'Send your feedback',
              onTap: () {
                // Navigate to Feedback Page
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        String? subtitle,
        Color? iconColor,
        required VoidCallback onTap,
      }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: iconColor ?? Theme.of(context).iconTheme.color),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}