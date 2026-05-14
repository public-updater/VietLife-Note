import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:lunar/lunar.dart' hide Holiday;
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vietlife_note/core/constants/app_constants.dart';
import 'package:vietlife_note/core/utils/date_utils.dart';
import 'package:vietlife_note/core/utils/responsive.dart';
import 'package:vietlife_note/domain/entities/holiday.dart';
import 'package:vietlife_note/domain/entities/note.dart';
import 'package:vietlife_note/presentation/providers/holiday_provider.dart';
import 'package:vietlife_note/presentation/providers/note_provider.dart';
import 'package:vietlife_note/presentation/providers/mood_provider.dart';
import 'package:vietlife_note/presentation/widgets/glass_card.dart';
import 'package:vietlife_note/presentation/widgets/holiday_card.dart';
import 'package:vietlife_note/presentation/widgets/note_card.dart';
import 'package:vietlife_note/presentation/screens/create_note/create_note_screen.dart';
import 'package:vietlife_note/presentation/providers/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    final holidayState = ref.watch(holidayProvider);
    final noteState = ref.watch(noteProvider);
    final moodState = ref.watch(moodProvider);

    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaler.scale(1.0);
    final appBarHeight = (screenHeight * 0.20 * textScale).clamp(150.0, 260.0);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              expandedHeight: appBarHeight,
              floating: false,
              pinned: true,
              title: Text(
                AppConstants.appName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                    ),
              ),
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primary.withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Builder(
                          builder: (context) {
                            final now = DateTime.now();
                            final solar = Solar.fromDate(now);
                            final lunar = Lunar.fromSolar(solar);
                            
                            final dayGanZhi = _translateLunar(lunar.getDayInGanZhi());
                            final monthGanZhi = _translateLunar(lunar.getMonthInGanZhi());
                            final yearGanZhi = _translateLunar(lunar.getYearInGanZhi());
                            final xiShen = _translateLunar(lunar.getDayPositionXiDesc());
                            final caiShen = _translateLunar(lunar.getDayPositionCaiDesc());
                            final nenLam = _translateActivities(lunar.getDayYi());
                            final kiengKy = _translateActivities(lunar.getDayJi());

                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      AppDateUtils.formatDate(now).replaceAll('/', '-'),
                                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(width: 8),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        '${lunar.getDay().toString().padLeft(2, '0')}-${lunar.getMonth().toString().padLeft(2, '0')}-${lunar.getYear()}',
                                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                              color: Colors.white.withOpacity(0.9),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  margin: const EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.25),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.1),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Ngày $dayGanZhi, Tháng $monthGanZhi, Năm $yearGanZhi',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Hỷ thần: $xiShen - Tài thần: $caiShen',
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                              color: Colors.white.withOpacity(0.9),
                                            ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Divider(color: Colors.white24, height: 12),
                                      Text(
                                        'Nên làm: $nenLam',
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                              color: Colors.greenAccent,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Kiêng kỵ: $kiengKy',
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                              color: Colors.orangeAccent,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mood Picker
                    if (moodState.todayMood == null)
                      GlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  PhosphorIconsRegular.smiley,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Cảm xúc hôm nay thế nào?',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildMoodButton('happy', PhosphorIconsRegular.smiley, Colors.yellow),
                                _buildMoodButton('calm', PhosphorIconsRegular.smileyBlank, Colors.blue),
                                _buildMoodButton('sad', PhosphorIconsRegular.smileySad, Colors.grey),
                                _buildMoodButton('productive', PhosphorIconsRegular.smileyWink, Colors.green),
                              ],
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: AppConstants.spacingL),

                    // Quick Actions
                    Row(
                      children: [
                        Expanded(
                          child: _buildQuickAction(
                            context,
                            icon: PhosphorIconsRegular.plus,
                            label: 'Ghi chú',
                            color: Colors.blue,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CreateNoteScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: AppConstants.spacingM),
                        Expanded(
                          child: _buildQuickAction(
                            context,
                            icon: PhosphorIconsRegular.calendarCheck,
                            label: 'Lịch',
                            color: Colors.green,
                            onTap: () {
                              ref.read(mainTabIndexProvider.notifier).state = 1;
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppConstants.spacingL),

                    // Calendar
                    GlassCard(
                      child: TableCalendar(
                        locale: 'vi',
                        firstDay: DateTime(2020, 1, 1),
                        lastDay: DateTime(2030, 12, 31),
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
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: Theme.of(context).textTheme.titleMedium!,
                          titleTextFormatter: (date, locale) {
                            final text = DateFormat.yMMMM(locale).format(date);
                            return '${text[0].toUpperCase()}${text.substring(1)}';
                          },
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

                    const SizedBox(height: AppConstants.spacingL),

                    // Upcoming Holidays
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ngày lễ sắp tới',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            ref.read(mainTabIndexProvider.notifier).state = 1;
                          },
                          child: const Text('Xem tất cả'),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacingM),

                    if (holidayState.status == HolidayStatus.loading)
                      const Center(child: CircularProgressIndicator())
                    else if (holidayState.status == HolidayStatus.error)
                      Center(
                        child: Text(
                          'Có lỗi xảy ra: ${holidayState.errorMessage}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.red,
                              ),
                        ),
                      )
                    else if (holidayState.holidays.isEmpty)
                      GlassCard(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(AppConstants.spacingL),
                            child: Column(
                              children: [
                                Icon(
                                  PhosphorIconsRegular.calendarBlank,
                                  size: 48,
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                const SizedBox(height: AppConstants.spacingM),
                                Text(
                                  'Không có ngày lễ sắp tới',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: holidayState.holidays.take(3).length,
                        itemBuilder: (context, index) {
                          final holiday = holidayState.holidays[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppConstants.spacingM,
                            ),
                            child: HolidayCard(holiday: holiday),
                          );
                        },
                      ),

                    const SizedBox(height: AppConstants.spacingL),

                    // Recent Notes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ghi chú gần đây',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            ref.read(mainTabIndexProvider.notifier).state = 2;
                          },
                          child: const Text('Xem tất cả'),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacingM),

                    if (noteState.status == NoteStatus.loading)
                      const Center(child: CircularProgressIndicator())
                    else if (noteState.notes.isEmpty)
                      GlassCard(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(AppConstants.spacingL),
                            child: Column(
                              children: [
                                Icon(
                                  PhosphorIconsRegular.notebook,
                                  size: 48,
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                const SizedBox(height: AppConstants.spacingM),
                                Text(
                                  'Bạn chưa có ghi chú nào',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: noteState.notes.take(3).length,
                        itemBuilder: (context, index) {
                          final note = noteState.notes[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppConstants.spacingM,
                            ),
                            child: NoteCard(
                              note: note,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CreateNoteScreen(existingNote: note),
                                  ),
                                );
                              },
                              onPin: () {
                                if (note.isPinned) {
                                  ref.read(noteProvider.notifier).unpinNote(note.id);
                                } else {
                                  ref.read(noteProvider.notifier).pinNote(note.id);
                                }
                              },
                              onDelete: () {
                                ref.read(noteProvider.notifier).deleteNote(note.id);
                              },
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreateNoteScreen(),
            ),
          );
        },
        icon: const Icon(PhosphorIconsRegular.plus),
        label: const Text('Tạo ghi chú'),
      ),
    );
  }

  String _translateLunar(String text) {
    if (text.isEmpty) return text;
    var result = text;
    // Thiên can
    result = result.replaceAll('甲', 'Giáp ');
    result = result.replaceAll('乙', 'Ất ');
    result = result.replaceAll('丙', 'Bính ');
    result = result.replaceAll('丁', 'Đinh ');
    result = result.replaceAll('戊', 'Mậu ');
    result = result.replaceAll('己', 'Kỷ ');
    result = result.replaceAll('庚', 'Canh ');
    result = result.replaceAll('辛', 'Tân ');
    result = result.replaceAll('壬', 'Nhâm ');
    result = result.replaceAll('癸', 'Quý ');

    // Địa chi
    result = result.replaceAll('子', 'Tý');
    result = result.replaceAll('丑', 'Sửu');
    result = result.replaceAll('寅', 'Dần');
    result = result.replaceAll('卯', 'Mão');
    result = result.replaceAll('辰', 'Thìn');
    result = result.replaceAll('巳', 'Tỵ');
    result = result.replaceAll('午', 'Ngọ');
    result = result.replaceAll('未', 'Mùi');
    result = result.replaceAll('申', 'Thân');
    result = result.replaceAll('酉', 'Dậu');
    result = result.replaceAll('戌', 'Tuất');
    result = result.replaceAll('亥', 'Hợi');

    // Hướng
    result = result.replaceAll('正', 'Chính ');
    result = result.replaceAll('中', 'Trung ');
    result = result.replaceAll('东北', 'Đông Bắc');
    result = result.replaceAll('东南', 'Đông Nam');
    result = result.replaceAll('西北', 'Tây Bắc');
    result = result.replaceAll('西南', 'Tây Nam');
    result = result.replaceAll('东', 'Đông');
    result = result.replaceAll('南', 'Nam');
    result = result.replaceAll('西', 'Tây');
    result = result.replaceAll('北', 'Bắc');

    return result.trim();
  }

  String _translateActivities(List<String> activities) {
    if (activities.isEmpty) return 'Không có';
    
    final dictionary = {
      '祭祀': 'Cúng bái',
      '祈福': 'Cầu phúc',
      '求嗣': 'Cầu con',
      '装修': 'Sửa nhà',
      '出行': 'Đi xa',
      '嫁娶': 'Cưới hỏi',
      '安床': 'Kê giường',
      '移徙': 'Dọn nhà',
      '开市': 'Khai trương',
      '交易': 'Mua bán',
      '入宅': 'Vào nhà mới',
      '破土': 'Động thổ',
      '安葬': 'Chôn cất',
      '纳采': 'Dạm ngõ',
      '订盟': 'Đính hôn',
      '开光': 'Khai quang',
      '解除': 'Giải hạn',
      '理发': 'Cắt tóc',
      '伐木': 'Chặt cây',
      '栽种': 'Trồng cây',
      '纳畜': 'Mua vật nuôi',
      '修造': 'Sửa nhà cửa',
      '造庙': 'Xây chùa',
      '立券': 'Ký hợp đồng',
      '挂匾': 'Treo bảng',
      '作灶': 'Làm bếp',
      '出火': 'Dọn bàn thờ',
      '沐浴': 'Tắm gội',
      '冠笄': 'Lễ trưởng thành',
      '扫舍': 'Dọn dẹp',
      '动土': 'Đào móng',
      '赴任': 'Nhận việc',
      '竖柱': 'Dựng cột',
      '上梁': 'Cất nóc',
      '纳财': 'Gửi/Nhận tiền',
      '会亲友': 'Gặp gỡ',
      '塑绘': 'Làm nghệ thuật',
      '拆卸': 'Tháo dỡ',
      '起基': 'Làm móng',
      '斋醮': 'Cầu an',
      '诸事不宜': 'Tránh việc lớn',
      '破屋': 'Dỡ nhà',
      '坏垣': 'Đập tường',
      '治病': 'Chữa bệnh',
      '求医': 'Khám bệnh',
      '订婚': 'Đính hôn',
      '领证': 'Làm giấy tờ',
      '入殓': 'Tẩm liệm',
      '移柩': 'Di quan',
      '谢土': 'Tạ đất',
      '塞穴': 'Lấp hố',
      '开仓': 'Mở kho',
      '裁衣': 'May mặc',
      '安机械': 'Lắp máy móc',
      '造桥': 'Xây cầu',
      '筑堤': 'Đắp đê',
      '造船': 'Đóng tàu',
      '合帐': 'Mua rèm màn',
      '安门': 'Lắp cửa',
      '进人口': 'Thêm người',
      '成服': 'Chịu tang',
      '除服': 'Mãn tang',
      '造车器': 'Mua xe',
    };

    final translated = <String>[];
    for (final act in activities) {
      if (dictionary.containsKey(act)) {
        translated.add(dictionary[act]!);
      }
    }

    if (translated.isEmpty) return 'Không có';
    return translated.take(5).join(', ');
  }

  Widget _buildMoodButton(String mood, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        ref.read(moodProvider.notifier).addMood(moodType: mood);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: 32),
      ),
    );
  }

  Widget _buildQuickAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(AppConstants.spacingM),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
