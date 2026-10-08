import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final prompts = [
      {'icon': Icons.wb_sunny, 'title': 'Morning Blessing', 'prompt': 'What gave you immediate energy today?'},
      {'icon': Icons.people, 'title': 'Gratitude for Others', 'prompt': 'Who inspired you or helped you recently?'},
      {'icon': Icons.spa, 'title': 'Personal Victory', 'prompt': 'What is one small win you are proud of?'}
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Gratitude Journal'), actions: [IconButton(icon: const Icon(Icons.add_circle_outline, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final p in prompts) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(20)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Icon(p['icon'] as IconData, color: AppTheme.primary),
                  const SizedBox(width: 10),
                  Text(p['title'] as String, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ]),
                const SizedBox(height: 10),
                Text(p['prompt'] as String, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                const SizedBox(height: 14),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Write your thought...',
                    hintStyle: const TextStyle(color: Colors.white30, fontSize: 13),
                    filled: true,
                    fillColor: AppTheme.surface,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
              ]),
            ),
          ],
        ],
      ),
    );
  }
}
