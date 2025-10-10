import 'dart:ui';

class MedicalService {
  final String title;
  final String icon;
  final VoidCallback onTap;

  MedicalService({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}