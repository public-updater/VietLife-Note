import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vietlife_note/core/constants/app_constants.dart';
import 'package:vietlife_note/core/utils/date_utils.dart';
import 'package:vietlife_note/domain/entities/holiday.dart';
import 'package:vietlife_note/presentation/widgets/glass_card.dart';

class HolidayCard extends StatelessWidget {
  final Holiday holiday;

  const HolidayCard({
    super.key,
    required this.holiday,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: () {
        // Navigate to holiday detail
      },
      child: Row(
        children: [
          // Date Box
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(holiday.color).withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  holiday.date.day.toString(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Color(holiday.color),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  holiday.date.month.toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color(holiday.color),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppConstants.spacingM),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  holiday.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: AppConstants.spacingXS),
                Text(
                  holiday.shortDescription,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: AppConstants.spacingXS),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: Color(holiday.color),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      AppDateUtils.formatCountdown(holiday.date),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Color(holiday.color),
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: AppConstants.spacingM),
          // Icon
          Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    ).animate().fadeIn().slideX();
  }
}
