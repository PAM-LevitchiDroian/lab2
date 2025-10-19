import 'package:app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isEmergency;
  final double height;

  const ServiceCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.isEmergency = false,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Imaginea de fundal
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback dacă imaginea nu există
                return Container(
                  color: isEmergency 
                      ? AppTheme.emergencyRed.withOpacity(0.1) 
                      : Colors.grey[200],
                  child: Icon(
                    _getIconForService(),
                    size: 40,
                    color: isEmergency ? AppTheme.emergencyRed : Colors.grey[400],
                  ),
                );
              },
            ),
            
            // Overlay gradient pentru vizibilitate text
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isEmergency
                      ? [
                          AppTheme.emergencyRed.withOpacity(0.6),
                          AppTheme.emergencyRed.withOpacity(0.85),
                        ]
                      : [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.5),
                        ],
                ),
              ),
            ),
            
            // Text overlay
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          offset: Offset(0, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Badge pentru Emergency
            if (isEmergency)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Text(
                    'SOS',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE53935),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForService() {
    switch (title) {
      case 'Book Appointment':
        return Icons.calendar_today;
      case 'Instant Video Consult':
        return Icons.video_call;
      case 'Medicines':
        return Icons.medication;
      case 'Lab Tests':
        return Icons.biotech;
      case 'Emergency':
        return Icons.emergency;
      default:
        return Icons.medical_services;
    }
  }
}