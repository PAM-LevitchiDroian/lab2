import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class InfoTabContent extends StatefulWidget {
  const InfoTabContent({super.key});

  @override
  State<InfoTabContent> createState() => _InfoTabContentState();
}

class _InfoTabContentState extends State<InfoTabContent> {
  int _selectedDay = 1; // 0: Today, 1: Tomorrow, 2: 17 Oct
  String _selectedTimeSlot = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Appointment Card
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('In-Clinic Appointment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text('৳1,000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.primaryColor)),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Evercare Hospital Ltd.', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Showing 2 more clinics')),
                            );
                          },
                          child: const Text('2 More clinic'),
                        ),
                      ],
                    ),
                    const Text('Bashundhara, Dhaka', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                    const SizedBox(height: 4),
                    const Text('20 mins or less wait time', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildDayTab('Today', '(No Slot)', 0)),
                        const SizedBox(width: 8),
                        Expanded(child: _buildDayTab('Tomorrow', '(20 Slot)', 1)),
                        const SizedBox(width: 8),
                        Expanded(child: _buildDayTab('17 Oct', '(10 Slot)', 2)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _selectedDay == 0
                          ? [const Text('No slots available', style: TextStyle(color: AppTheme.textSecondary))]
                          : [
                              _buildTimeSlot('06:00 - 06:30'),
                              _buildTimeSlot('06:30 - 07:00'),
                              _buildTimeSlot('07:00 - 07:30'),
                              if (_selectedDay == 2) ...[
                                _buildTimeSlot('07:30 - 08:00'),
                                _buildTimeSlot('08:00 - 08:30'),
                              ],
                            ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Timing Section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Timing', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(child: _buildTimingCard('Monday', '09:00 AM - 05:00 PM')),
              const SizedBox(width: 12),
              Expanded(child: _buildTimingCard('Tuesday', '09:00 AM - 05:00 PM')),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Location Section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(child: _buildLocationCard('Shahbag', 'BSSMU - Bangabandh...')),
              const SizedBox(width: 12),
              Expanded(child: _buildLocationCard('Boshundhora', 'Evercare Hospital Ltd')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDayTab(String day, String slots, int index) {
    final isActive = _selectedDay == index;
    final hasSlots = index != 0;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDay = index;
          _selectedTimeSlot = '';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primaryColor.withOpacity(0.1) : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isActive ? AppTheme.primaryColor : Colors.transparent),
        ),
        child: Column(
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: hasSlots ? AppTheme.textPrimary : AppTheme.textSecondary,
              ),
            ),
            Text(slots, style: TextStyle(fontSize: 10, color: hasSlots ? AppTheme.primaryColor : AppTheme.textSecondary)),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String time) {
    final isSelected = _selectedTimeSlot == time;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTimeSlot = time;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected: $time')),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : AppTheme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : AppTheme.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTimingCard(String day, String time) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(day, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(time, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildLocationCard(String area, String hospital) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location: $area - $hospital')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(area, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(hospital, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary), overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
