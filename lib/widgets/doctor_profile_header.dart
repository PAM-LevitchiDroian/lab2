import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/doctor_model.dart';

class DoctorProfileHeader extends StatelessWidget {
  final Doctor doctor;
  const DoctorProfileHeader({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(doctor.imageAsset),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                Text(doctor.specialty,
                    style: const TextStyle(fontSize: 14, color: AppTheme.textSecondary)),
                const SizedBox(height: 4),
                Text(doctor.qualification,
                    style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildStatItem(Icons.star, doctor.rating.toStringAsFixed(1), 'Rating & Review'),
                    const SizedBox(width: 16),
                    _buildStatItem(Icons.work_outline, '${doctor.yearsOfWork}', 'Ani de lucru'),
                    const SizedBox(width: 16),
                    _buildStatItem(Icons.people_outline, '${doctor.numberOfPatients}', 'Nr. pacienți'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: AppTheme.primaryColor),
            const SizedBox(width: 4),
            Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        ),
        Text(label, style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
      ],
    );
  }
}
