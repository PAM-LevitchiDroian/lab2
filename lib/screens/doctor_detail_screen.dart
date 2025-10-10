import 'package:flutter/material.dart';
import '../widgets/doctor_profile_header.dart';
import '../models/doctor_model.dart';
import '../theme/app_theme.dart';

class DoctorDetailScreen extends StatefulWidget {
  final Doctor doctor;
  const DoctorDetailScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  int _selectedTab = 0;
  int _selectedDay = 1;
  String _selectedTimeSlot = '';
  int? _expandedHistoryIndex;
  int? _expandedReviewIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(widget.doctor.specialty),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border),
            onPressed: () => ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Added to favorites'))),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Settings opened'))),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorProfileHeader(doctor: widget.doctor),
            const SizedBox(height: 16),
            _buildTabSection(),
            const SizedBox(height: 16),
            _buildTabContent(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ----- Tabs -----
  Widget _buildTabSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(child: _buildTab('Info', 0)),
          Expanded(child: _buildTab('History', 1)),
          Expanded(child: _buildTab('Review', 2)),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isActive = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? AppTheme.primaryColor : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive ? AppTheme.textPrimary : AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 0:
        return _buildInfoTab();
      case 1:
        return _buildHistoryTab();
      case 2:
        return _buildReviewTab();
      default:
        return _buildInfoTab();
    }
  }

  // ----- INFO TAB (identic cu al tău, doar culorile extrase) -----
  Widget _buildInfoTab() {
    return Column(
      children: [
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
                  Text('In-Clinic Appointment',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text('৳1,000',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryColor)),
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
                        const Text('Evercare Hospital Ltd.',
                            style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                        TextButton(
                          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Showing 2 more clinics'))),
                          child: const Text('2 More clinic'),
                        ),
                      ],
                    ),
                    const Text('Bashundhara, Dhaka',
                        style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                    const SizedBox(height: 4),
                    const Text('20 mins or less wait time',
                        style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
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
                          ? const [
                              Text('No slots available',
                                  style: TextStyle(color: AppTheme.textSecondary))
                            ]
                          : [
                              _buildTimeSlot('06:00 - 06:30'),
                              _buildTimeSlot('06:30 - 07:00'),
                              _buildTimeSlot('07:00 - 07:30'),
                            ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Timing',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(child: _buildTimingCard('Monday', '09:00 AM - 05:00 PM')),
              const SizedBox(width: 12),
              Expanded(child: _buildTimingCard('Monday', '09:00 AM - 05:00 PM')),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Location',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
      onTap: () => setState(() {
        _selectedDay = index;
        _selectedTimeSlot = '';
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primaryColor.withOpacity(0.1) : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isActive ? AppTheme.primaryColor : Colors.transparent),
        ),
        child: Column(
          children: [
            Text(day,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400)),
            Text(slots,
                style: TextStyle(
                    fontSize: 10,
                    color: hasSlots ? AppTheme.primaryColor : AppTheme.textSecondary)),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String time) {
    final isSelected = _selectedTimeSlot == time;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedTimeSlot = time);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Selected: $time')));
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
      onTap: () => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Location: $area - $hospital'))),
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
            Text(hospital,
                style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  // ----- HISTORY TAB (ca la tine) -----
  Widget _buildHistoryTab() {
    final historyData = [
      {
        'date': '15 Sep 2024',
        'time': '10:00 AM',
        'type': 'In-Clinic Consultation',
        'status': 'Completed',
        'color': Colors.green,
        'details':
            'General checkup completed. Blood pressure: 120/80. Heart rate normal.'
      },
      {
        'date': '08 Aug 2024',
        'time': '02:30 PM',
        'type': 'Video Consultation',
        'status': 'Completed',
        'color': Colors.green,
        'details':
            'Follow-up consultation. Prescribed medication adjusted. Patient feeling better.'
      },
      {
        'date': '22 Jul 2024',
        'time': '11:00 AM',
        'type': 'In-Clinic Consultation',
        'status': 'Cancelled',
        'color': Colors.red,
        'details': 'Appointment cancelled by patient due to emergency.'
      },
      {
        'date': '10 Jun 2024',
        'time': '09:00 AM',
        'type': 'Follow-up Visit',
        'status': 'Completed',
        'color': Colors.green,
        'details':
            'Routine follow-up. All test results normal. Next visit in 3 months.'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Appointment History',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          ...List.generate(historyData.length, (index) {
            final item = historyData[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildHistoryCard(
                index,
                item['date'] as String,
                item['time'] as String,
                item['type'] as String,
                item['status'] as String,
                item['color'] as Color,
                item['details'] as String,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(int index, String date, String time, String type,
      String status, Color statusColor, String details) {
    final isExpanded = _expandedHistoryIndex == index;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(date, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(status,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500, color: statusColor)),
                  ),
                ]),
                const SizedBox(height: 8),
                Text(time, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary)),
                const SizedBox(height: 4),
                Text(type, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary)),
                if (isExpanded) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Details:',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(details,
                            style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          InkWell(
            onTap: () => setState(() {
              _expandedHistoryIndex = isExpanded ? null : index;
            }),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.05),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isExpanded ? 'Hide Details' : 'View Details',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.primaryColor)),
                  const SizedBox(width: 4),
                  Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: AppTheme.primaryColor, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ----- REVIEW TAB (ca la tine) -----
  Widget _buildReviewTab() {
    final reviewData = [
      {
        'name': 'Sarah Johnson',
        'date': '2 days ago',
        'rating': 5,
        'comment':
            'Dr. ${widget.doctor.name} is excellent! Very thorough and explains everything clearly. The staff is also very professional.',
        'response': 'Thank you for your kind words! We appreciate your feedback.'
      },
      {
        'name': 'Michael Chen',
        'date': '1 week ago',
        'rating': 4,
        'comment':
            'Good experience overall. The doctor was knowledgeable and took time to answer all my questions.',
        'response': 'Thank you for your review! We\'re glad you had a positive experience.'
      },
      {
        'name': 'Emma Davis',
        'date': '2 weeks ago',
        'rating': 5,
        'comment':
            'Highly recommend! ${widget.doctor.name} is caring and professional. The clinic is clean and well-organized.',
        'response':
            'We appreciate your recommendation! Looking forward to your next visit.'
      },
      {
        'name': 'John Smith',
        'date': '3 weeks ago',
        'rating': 5,
        'comment': 'Very attentive and professional.',
        'response': 'Thank you for trusting us with your care!'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
            Text('Patient Reviews',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 16),
          ...List.generate(reviewData.length, (index) {
            final item = reviewData[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildReviewCard(
                index,
                item['name'] as String,
                item['date'] as String,
                item['rating'] as int,
                item['comment'] as String,
                item['response'] as String,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildReviewCard(
      int index, String name, String date, int rating, String comment, String response) {
    final isExpanded = _expandedReviewIndex == index;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                    child: Text(name[0],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: AppTheme.primaryColor)),
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
                        (i) => Icon(i < rating ? Icons.star : Icons.star_border,
                            color: Colors.amber, size: 16)),
                  ),
                ]),
                const SizedBox(height: 12),
                Text(comment,
                    style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.5)),
                if (isExpanded) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: const [
                          Icon(Icons.medical_services, size: 16, color: AppTheme.primaryColor),
                          SizedBox(width: 6),
                          Text('Doctor\'s Response:',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.primaryColor)),
                        ]),
                        const SizedBox(height: 6),
                        Text(response,
                            style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          InkWell(
            onTap: () => setState(() {
              _expandedReviewIndex = isExpanded ? null : index;
            }),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.05),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isExpanded ? 'Hide Response' : 'View Response',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.primaryColor)),
                  const SizedBox(width: 4),
                  Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: AppTheme.primaryColor, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
