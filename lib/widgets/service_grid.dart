import 'package:app/widgets/service_card.dart';
import 'package:flutter/material.dart';

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'title': 'Book Appointment', 'icon': '💻'},
      {'title': 'Instant Video Consult', 'icon': '👨‍⚕️'},
      {'title': 'Medicines', 'icon': '💊'},
      {'title': 'Lab Tests', 'icon': '🔬'},
      {'title': 'Emergency', 'icon': '🚨'},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.85,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ServiceCard(
            title: service['title']!,
            icon: service['icon']!,
            isEmergency: service['title'] == 'Emergency',
          );
        },
      ),
    );
  }
}