import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab3Screen extends StatefulWidget {
  const Tab3Screen({super.key});
  @override
  State<Tab3Screen> createState() => _Tab3ScreenState();
}
class _Tab3ScreenState extends State<Tab3Screen> {
  int _step = 0;
  final steps = ['Inhale deeply (4s)', 'Hold breath (4s)', 'Exhale slowly (4s)', 'Rest (4s)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mindful Breathing'), actions: [IconButton(icon: const Icon(Icons.spa, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => setState(() => _step = (_step + 1) % steps.length),
              child: Container(
                width: 220, height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [AppTheme.primary.withValues(alpha: 0.35), Colors.transparent]),
                  border: Border.all(color: AppTheme.primary, width: 4),
                ),
                child: Center(
                  child: Text(steps[_step], textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text('Box Breathing Protocol', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            const Text('Tap circle to advance cycle', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
