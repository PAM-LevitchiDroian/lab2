import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/search_bar_widget.dart';     
import '../widgets/service_grid.dart';         
import '../widgets/speciality_section.dart';   
import '../widgets/specialists_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AppHeader(
                name: 'Levitchi Dorian',
                location: 'Chisinau, Moldova',
                avatarAsset: 'assets/images/avatar/user_avatar.jpg',
              ),
              SizedBox(height: 16),
              SearchBarWidget(),
              ServiceGrid(),
              SizedBox(height: 16),
              SpecialitySection(),
              SizedBox(height: 16),
              SpecialistsSection(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
