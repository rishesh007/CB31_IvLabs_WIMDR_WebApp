import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Dashboard", icon: Icons.dashboard),
  NavigationModel(title: "Notifications", icon: Icons.notifications),
  NavigationModel(title: "Settings", icon: Icons.settings),
  NavigationModel(title: "Authenticate",icon: Icons.verified_user),
  NavigationModel(title: "Logout", icon: Icons.exit_to_app),
];