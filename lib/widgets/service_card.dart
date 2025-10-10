import 'package:app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String icon;
  final bool isEmergency;

  const ServiceCard({
    super.key,
    required this.title,
    required this.icon,
    this.isEmergency = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isEmergency ? AppTheme.emergencyRed : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isEmergency ? Colors.white : AppTheme.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}