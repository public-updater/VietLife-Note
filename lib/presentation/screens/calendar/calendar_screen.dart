import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:vietlife_note/core/constants/app_constants.dart';
import 'package:vietlife_note/core/utils/date_utils.dart';
import 'package:vietlife_note/presentation/widgets/glass_card.dart';
import 'package:vietlife_note/presentation/screens/create_note/create_note_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vietlife_note/domain/entities/note.dart';
import 'package:vietlife_note/domain/entities/holiday.dart';
import 'package:vietlife_note/presentation/providers/note_provider.dart';
import 'package:vietlife_note/presentation/providers/holiday_provider.dart';
import 'package:vietlife_note/presentation/widgets/holiday_card.dart';
import 'package:vietlife_note/presentation/widgets/note_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    final noteState = ref.watch(noteProvider);
    final holidayState = ref.watch(holidayProvider);
    
    final selectedDay = _selectedDay ?? DateTime.now();
    final notesForDay = noteState.notes.where((note) => isSameDay(note.date, selectedDay)).toList();
    final holidaysForDay = holidayState.holidays.where((holiday) => isSameDay(holiday.date, selectedDay)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch'),
        actions: [
          IconButton(
            icon: const Icon(Icons.today),
            onPressed: () {
              setState(() {
                _focusedDay = DateTime.now();
                _selectedDay = DateTime.now();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Calendar
          Padding(
            padding: const EdgeInsets.all(AppConstants.spacingM),
            child: GlassCard(
              child: TableCalendar(
              locale: 'vi',
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: Theme.of(context).textTheme.titleMedium!,
                titleTextFormatter: (date, locale) {
                  final text = DateFormat.yMMMM(locale).format(date);
                  return '${text[0].toUpperCase()}${text.substring(1)}';
                },
                leftChevronIcon: const Icon(Icons.chevron_left),
                rightChevronIcon: const Icon(Icons.chevron_right),
              ),
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                todayDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              eventLoader: (day) {
                final notes = noteState.notes.where((n) => isSameDay(n.date, day)).toList();
                final holidays = holidayState.holidays.where((h) => isSameDay(h.date, day)).toList();
                return [...notes, ...holidays];
              },
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  if (events.isEmpty) return const SizedBox();

                  return Positioned(
                    bottom: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: events.take(4).map((event) {
                        Color dotColor;
                        if (event is Note) {
                          dotColor = Color(event.color);
                        } else if (event is Holiday) {
                          dotColor = Colors.red;
                        } else {
                          dotColor = Theme.of(context).colorScheme.secondary;
                        }
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 1.5),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: dotColor,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
            ),
          ),

          // Selected Day Info
          if (_selectedDay != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppDateUtils.formatFullDate(_selectedDay!),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppConstants.spacingM),
                    Text(
                      'Sự kiện trong ngày',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppConstants.spacingM),
                    Expanded(
                      child: notesForDay.isEmpty && holidaysForDay.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(PhosphorIconsRegular.calendarBlank, size: 64, color: Colors.grey[400]),
                                      Positioned(
                                        top: 20,
                                        child: Text(
                                          '${selectedDay.day}',
                                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[400]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppConstants.spacingM),
                                  Text(
                                    'Chưa có sự kiện nào',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: Colors.grey,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          : ListView(
                              children: [
                                ...holidaysForDay.map((h) => Padding(
                                  padding: const EdgeInsets.only(bottom: AppConstants.spacingS),
                                  child: HolidayCard(holiday: h),
                                )),
                                ...notesForDay.map((n) => Padding(
                                  padding: const EdgeInsets.only(bottom: AppConstants.spacingS),
                                  child: NoteCard(
                                    note: n,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CreateNoteScreen(existingNote: n),
                                        ),
                                      );
                                    },
                                    onPin: () {
                                      if (n.isPinned) {
                                        ref.read(noteProvider.notifier).unpinNote(n.id);
                                      } else {
                                        ref.read(noteProvider.notifier).pinNote(n.id);
                                      }
                                    },
                                    onDelete: () {
                                      ref.read(noteProvider.notifier).deleteNote(n.id);
                                    },
                                  ),
                                )),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNoteScreen(initialDate: _selectedDay),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

