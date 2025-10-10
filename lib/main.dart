import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/doctor_detail_screen.dart';
import 'models/doctor_model.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      theme: AppTheme.lightTheme, 
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/doctor-detail') {
          final doctor = settings.arguments as Doctor; 
          return MaterialPageRoute(
            builder: (_) => DoctorDetailScreen(doctor: doctor),
          );
        }
        return null;
      },
    );
  }
}
