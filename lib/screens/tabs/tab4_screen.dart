import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mindset Growth'), actions: [IconButton(icon: const Icon(Icons.emoji_events, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(20)),
            child: Row(children: const [
              Icon(Icons.local_fire_department, color: AppTheme.primary, size: 40),
              SizedBox(width: 16),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('14 Days Streak!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Daily affirmation habit active', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
              ]),
            ]),
          ),
          const SizedBox(height: 16),
          const Text('Mood Distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          for (final m in [
            {'mood': '😌 Calm & Focused', 'pct': '55%', 'val': 0.55, 'c': Colors.tealAccent},
            {'mood': '⚡ Inspired & Driven', 'pct': '30%', 'val': 0.30, 'c': Colors.amberAccent},
            {'mood': '😊 Joyful & Grateful', 'pct': '15%', 'val': 0.15, 'c': Colors.pinkAccent},
          ]) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(m['mood'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(m['pct'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ]),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: m['val'] as double, color: m['c'] as Color, backgroundColor: Colors.white10, minHeight: 6, borderRadius: BorderRadius.circular(3)),
              ]),
            ),
          ],
        ],
      ),
    );
  }
}
