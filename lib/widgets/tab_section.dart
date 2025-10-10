import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TabSection extends StatefulWidget {
  final Function(int) onTabChanged;
  final int initialTab;

  const TabSection({
    super.key,
    required this.onTabChanged,
    this.initialTab = 0,
  });

  @override
  State<TabSection> createState() => _TabSectionState();
}

class _TabSectionState extends State<TabSection> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
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
    final isActive = _selectedIndex == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        widget.onTabChanged(index);
      },
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
}
