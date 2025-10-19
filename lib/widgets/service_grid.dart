import 'package:app/widgets/service_card.dart';
import 'package:flutter/material.dart';

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Book Appointment',
        'imagePath': 'assets/images/services/book_appointment.jpg',
      },
      {
        'title': 'Instant Video Consult',
        'imagePath': 'assets/images/services/video_consult.jpg',
      },
      {
        'title': 'Medicines',
        'imagePath': 'assets/images/services/medicines.jpg',
      },
      {
        'title': 'Lab Tests',
        'imagePath': 'assets/images/services/lab_tests.jpg',
      },
      {
        'title': 'Emergency',
        'imagePath': 'assets/images/services/emergency.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // Rând 1: 2 carduri mari (Book Appointment și Video Consult)
          Row(
            children: [
              Expanded(
                child: ServiceCard(
                  title: services[0]['title']!,
                  imagePath: services[0]['imagePath']!,
                  isEmergency: false,
                  height: 120,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ServiceCard(
                  title: services[1]['title']!,
                  imagePath: services[1]['imagePath']!,
                  isEmergency: false,
                  height: 120,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Rând 2: 3 carduri mai mici (Medicines, Lab Tests, Emergency)
          Row(
            children: [
              Expanded(
                child: ServiceCard(
                  title: services[2]['title']!,
                  imagePath: services[2]['imagePath']!,
                  isEmergency: false,
                  height: 110,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ServiceCard(
                  title: services[3]['title']!,
                  imagePath: services[3]['imagePath']!,
                  isEmergency: false,
                  height: 110,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ServiceCard(
                  title: services[4]['title']!,
                  imagePath: services[4]['imagePath']!,
                  isEmergency: true,
                  height: 110,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
