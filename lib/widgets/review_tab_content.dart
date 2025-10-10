import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ReviewTabContent extends StatelessWidget {
  const ReviewTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Patient Reviews', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  SizedBox(width: 4),
                  Text('4.5', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text(' (125 reviews)', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildReviewCard(context, 'Sarah Johnson', '2 days ago', 5, 'Dr. Kathrin is excellent! Very thorough and explains everything clearly. The staff is also very professional.'),
          const SizedBox(height: 12),
          _buildReviewCard(context, 'Michael Chen', '1 week ago', 4, 'Good experience overall. The doctor was knowledgeable and took time to answer all my questions.'),
          const SizedBox(height: 12),
          _buildReviewCard(context, 'Emma Davis', '2 weeks ago', 5, 'Highly recommend! Dr. Kathrin is caring and professional. The clinic is clean and well-organized.'),
          const SizedBox(height: 12),
          _buildReviewCard(context, 'John Smith', '3 weeks ago', 5, 'Best cardiologist in town! Very attentive and professional.'),
        ],
      ),
    );
  }

  Widget _buildReviewCard(BuildContext context, String name, String date, int rating, String comment) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Review by $name')),
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
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                  child: Text(name[0], style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.primaryColor)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      Text(date, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(index < rating ? Icons.star : Icons.star_border, color: Colors.amber, size: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(comment, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.5)),
          ],
        ),
      ),
    );
  }
}