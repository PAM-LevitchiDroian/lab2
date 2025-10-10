import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppHeader extends StatelessWidget {
  final String name;
  final String location;
  final String avatarAsset; // <- avatar local

  const AppHeader({
    super.key,
    required this.name,
    required this.location,
    required this.avatarAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(avatarAsset),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    )),
                Text(location,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    )),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
