import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vietlife_note/core/constants/app_constants.dart';
import 'package:vietlife_note/core/utils/responsive.dart';
import 'package:vietlife_note/presentation/providers/mood_provider.dart';
import 'package:vietlife_note/presentation/providers/note_provider.dart';
import 'package:vietlife_note/presentation/widgets/glass_card.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moodState = ref.watch(moodProvider);
    final noteState = ref.watch(noteProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thống kê'),
      ),
      body: Builder(
        builder: (context) {
          Responsive.init(context);
          return SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview Cards
            _buildOverview(context, noteState),
            
            const SizedBox(height: AppConstants.spacingL),

            // Mood Distribution
            Text(
              'Phân bổ cảm xúc',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppConstants.spacingM),
            GlassCard(
              height: Responsive.scale(300),
              child: _buildMoodChart(context, moodState),
            ),

            const SizedBox(height: AppConstants.spacingL),

            // Productivity Chart
            Text(
              'Năng suất ghi chú',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppConstants.spacingM),
            GlassCard(
              height: Responsive.scale(300),
              child: _buildProductivityChart(context, noteState),
            ),

            const SizedBox(height: AppConstants.spacingL),

            // Heatmap placeholder
            Text(
              'Mật độ hoạt động',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppConstants.spacingM),
            GlassCard(
              height: Responsive.scale(200),
              child: Center(
                child: Text(
                  'Tính năng Heatmap đang phát triển',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
            ),

            const SizedBox(height: AppConstants.spacingXL),
          ],
        ),
      );
        },
      ),
    );
  }

  Widget _buildOverview(BuildContext context, NoteState noteState) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            label: 'Tổng ghi chú',
            value: noteState.notes.length.toString(),
            icon: PhosphorIconsRegular.notebook,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: AppConstants.spacingM),
        Expanded(
          child: _buildStatCard(
            context,
            label: 'Đã ghim',
            value: noteState.notes.where((n) => n.isPinned).length.toString(),
            icon: PhosphorIconsRegular.pushPin,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return GlassCard(
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildMoodChart(BuildContext context, MoodState state) {
    if (state.moods.isEmpty) {
      return const Center(child: Text('Chưa có dữ liệu cảm xúc'));
    }

    // Simplified data aggregation
    final counts = <String, int>{};
    for (var m in state.moods) {
      counts[m.moodType] = (counts[m.moodType] ?? 0) + 1;
    }

    final sections = counts.entries.map((e) {
      return PieChartSectionData(
        value: e.value.toDouble(),
        title: '${e.value}',
        color: _getMoodColor(e.key),
        radius: 50,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();

    return PieChart(
      PieChartData(
        sections: sections,
        centerSpaceRadius: 40,
        sectionsSpace: 2,
      ),
    );
  }

  Widget _buildProductivityChart(BuildContext context, NoteState state) {
    // Show notes count for last 7 days
    final now = DateTime.now();
    final data = List.generate(7, (i) {
      final date = now.subtract(Duration(days: 6 - i));
      final count = state.notes.where((n) => 
        n.createdAt.day == date.day && 
        n.createdAt.month == date.month && 
        n.createdAt.year == date.year).length;
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: count.toDouble(),
            color: Theme.of(context).colorScheme.primary,
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    });

    return BarChart(
      BarChartData(
        barGroups: data,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
                final index = value.toInt() % 7;
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(days[index], style: const TextStyle(fontSize: 10)),
                );
              },
            ),
          ),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }

  Color _getMoodColor(String mood) {
    switch (mood) {
      case 'happy': return Colors.yellow;
      case 'calm': return Colors.blue;
      case 'sad': return Colors.grey;
      case 'productive': return Colors.green;
      default: return Colors.purple;
    }
  }
}
