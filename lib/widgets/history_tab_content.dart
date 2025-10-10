import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HistoryTabContent extends StatelessWidget {
  const HistoryTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Appointment History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          _buildHistoryCard(context, '15 Sep 2024', '10:00 AM', 'In-Clinic Consultation', 'Completed', Colors.green),
          const SizedBox(height: 12),
          _buildHistoryCard(context, '08 Aug 2024', '02:30 PM', 'Video Consultation', 'Completed', Colors.green),
          const SizedBox(height: 12),
          _buildHistoryCard(context, '22 Jul 2024', '11:00 AM', 'In-Clinic Consultation', 'Cancelled', Colors.red),
          const SizedBox(height: 12),
          _buildHistoryCard(context, '10 Jun 2024', '09:00 AM', 'Follow-up Visit', 'Completed', Colors.green),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context, String date, String time, String type, String status, Color statusColor) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$type on $date - $status')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(status, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: statusColor)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(time, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary)),
            const SizedBox(height: 4),
            Text(type, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary)),
          ],
        ),
      ),
    );
  }
}
