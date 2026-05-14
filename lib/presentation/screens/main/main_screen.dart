import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vietlife_note/presentation/screens/calendar/calendar_screen.dart';
import 'package:vietlife_note/presentation/screens/home/home_screen.dart';
import 'package:vietlife_note/presentation/screens/notes/notes_screen.dart';
import 'package:vietlife_note/presentation/screens/statistics/statistics_screen.dart';
import 'package:vietlife_note/presentation/screens/settings/settings_screen.dart';
import 'package:vietlife_note/presentation/providers/providers.dart';
import 'package:vietlife_note/services/update/force_update_service.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CalendarScreen(),
    const NotesScreen(),
    const StatisticsScreen(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkUpdate();
    });
  }

  Future<void> _checkUpdate() async {
    // Small delay to ensure app is fully loaded
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    final needsUpdate = await ForceUpdateService.checkForUpdate();
    if (needsUpdate && mounted) {
      ForceUpdateService.showUpdateDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(mainTabIndexProvider);

    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          ref.read(mainTabIndexProvider.notifier).state = index;
        },
        destinations: [
          NavigationDestination(
            icon: Icon(PhosphorIconsRegular.house),
            selectedIcon: Icon(PhosphorIconsFill.house),
            label: 'Trang chủ',
          ),
          NavigationDestination(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(PhosphorIconsRegular.calendarBlank),
                Positioned(
                  top: 8,
                  child: Text(
                    '${DateTime.now().day}',
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            selectedIcon: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(PhosphorIconsFill.calendarBlank),
                Positioned(
                  top: 8,
                  child: Text(
                    '${DateTime.now().day}',
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
            label: 'Lịch',
          ),
          NavigationDestination(
            icon: Icon(PhosphorIconsRegular.notebook),
            selectedIcon: Icon(PhosphorIconsFill.notebook),
            label: 'Ghi chú',
          ),
          NavigationDestination(
            icon: Icon(PhosphorIconsRegular.chartBar),
            selectedIcon: Icon(PhosphorIconsFill.chartBar),
            label: 'Thống kê',
          ),
          NavigationDestination(
            icon: Icon(PhosphorIconsRegular.gear),
            selectedIcon: Icon(PhosphorIconsFill.gear),
            label: 'Cài đặt',
          ),
        ],
      ),
    );
  }
}
