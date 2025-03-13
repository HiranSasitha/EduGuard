import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eduguard/src/features/authentication/user/login/screens/login_select.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser; // Get current user

    return Drawer(
      elevation: 5.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user?.displayName ?? 'Email'), // Display name or fallback
            accountEmail: Text(user?.email ?? 'No Email Found'), // Show user email
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://plus.unsplash.com/premium_vector-1682269287900-d96e9a6c188b?bg=FFFFFF&q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home_rounded),
            title: const Text('Emergency SOS System'),
            onTap: () {
              // Navigate to the SOSHomePage
            },
          ),

          ListTile(
            leading: const Icon(Icons.school_rounded),
            title: const Text('Education'),
            onTap: () {
              // Navigate to the TestPage
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to the settings page
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Logout'),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear(); // Clear stored preferences

              await FirebaseAuth.instance.signOut(); // Sign out user
              Get.offAll(() => const LoginSelectScreen()); // Redirect to login screen
            },
          ),
        ],
      ),
    );
  }
}
