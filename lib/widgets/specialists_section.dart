import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/doctor_data.dart';
import '../widgets/doctor_card.dart';
import '../screens/doctor_detail_screen.dart';

class SpecialistsSection extends StatelessWidget {
  const SpecialistsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Specialists',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  )),
              // poți înlocui cu un buton "View all >" dacă vrei
            ],
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: doctorsGlobal.length,
            itemBuilder: (context, index) {
              final d = doctorsGlobal[index];
              return DoctorCard(
                doctor: d,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DoctorDetailScreen(doctor: d)),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
