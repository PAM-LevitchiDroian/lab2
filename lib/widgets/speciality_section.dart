import 'package:app/theme/app_theme.dart';
import 'package:app/widgets/speciality_chip.dart';
import 'package:flutter/material.dart';

class SpecialitySection extends StatelessWidget {
  const SpecialitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final specialities = [
      {'title': 'Eye Specialist', 'icon': Icons.remove_red_eye_outlined},
      {'title': 'Dentist', 'icon': Icons.phone_android},
      {'title': 'Cardiologist', 'icon': Icons.favorite_outline},
      {'title': 'Pulmonologist', 'icon': Icons.air},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            'Specialities most relevant to you',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: specialities.length,
            itemBuilder: (context, index) {
              final speciality = specialities[index];
              return SpecialityChip(
                title: speciality['title'] as String,
                icon: speciality['icon'] as IconData,
              );
            },
          ),
        ),
      ],
    );
  }
}