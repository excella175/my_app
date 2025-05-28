import 'package:flutter/material.dart';

class SidebarMenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  SidebarMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
