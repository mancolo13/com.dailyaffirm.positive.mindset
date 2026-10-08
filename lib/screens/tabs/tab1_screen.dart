import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}
class _Tab1ScreenState extends State<Tab1Screen> {
  int _quoteIdx = 0;
  final _quotes = [
    {"q": "I am in charge of how I feel and today I choose happiness, focus and inner calm.", "theme": "Inner Strength"},
    {"q": "Every challenge I face is an opportunity to grow and master my craft.", "theme": "Resilience"},
    {"q": "My mind is clear, my focus is sharp, and my potential is limitless.", "theme": "Clarity"},
    {"q": "I radiate positive energy and attract abundance into my life.", "theme": "Abundance"},
  ];

  @override
  Widget build(BuildContext context) {
    final cur = _quotes[_quoteIdx % _quotes.length];
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Affirmations'), actions: [IconButton(icon: const Icon(Icons.bookmark_border, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppTheme.card, AppTheme.surface], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(color: AppTheme.primary.withValues(alpha: 0.18), borderRadius: BorderRadius.circular(16)),
                    child: Text(cur['theme']!, style: const TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  const SizedBox(height: 24),
                  const Icon(Icons.format_quote_rounded, size: 48, color: AppTheme.primary),
                  const SizedBox(height: 12),
                  Text(cur['q']!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, height: 1.4, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.favorite_rounded, color: AppTheme.primary)),
                      const SizedBox(width: 12),
                      IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.share_rounded)),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () => setState(() => _quoteIdx++),
                icon: const Icon(Icons.auto_awesome, color: Colors.black),
                label: const Text('Next Affirmation', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
