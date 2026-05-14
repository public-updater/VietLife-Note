import 'package:flutter/material.dart';
import 'package:vietlife_note/core/constants/holiday_constants.dart';
import 'package:vietlife_note/domain/entities/holiday.dart';

class VietnameseHolidaysData {
  static List<Holiday> getHolidaysForYear(int year) {
    return [
      _createNationalHoliday(
        id: 'tet_duong_lich',
        title: 'Tết Dương Lịch',
        date: DateTime(year, 1, 1),
        short: 'Năm mới dương lịch',
        long: 'Tết Dương Lịch, hay còn gọi là Năm mới, là ngày lễ đầu tiên trong năm theo lịch dương.',
      ),
      _createLunarHoliday(
        year: year,
        lunarMonth: 1,
        lunarDay: 1,
        id: 'tet_nguyen_dan',
        title: 'Tết Nguyên Đán',
        short: 'Tết cổ truyền dân tộc',
        long: 'Tết Nguyên Đán là ngày lễ quan trọng nhất của người Việt, đánh dấu sự khởi đầu năm mới âm lịch.',
        color: 0xFFFF4D4F,
        isMajor: true,
      ),
      _createLunarHoliday(
        year: year,
        lunarMonth: 3,
        lunarDay: 10,
        id: 'gio_to_hung_vuong',
        title: 'Giỗ Tổ Hùng Vương',
        short: 'Ngày giỗ tổ dân tộc',
        long: 'Tưởng nhớ các Vua Hùng có công dựng nước.',
        color: 0xFFB71C1C,
        isMajor: true,
      ),
      _createNationalHoliday(
        id: '30_4',
        title: 'Ngày Giải phóng miền Nam',
        date: DateTime(year, 4, 30),
        short: 'Ngày thống nhất đất nước',
        long: 'Ngày 30/4/1975 đánh dấu sự thống nhất đất nước Việt Nam.',
      ),
      _createNationalHoliday(
        id: 'quoc_khanh',
        title: 'Ngày Quốc Khánh',
        date: DateTime(year, 9, 2),
        short: 'Ngày độc lập Việt Nam',
        long: 'Ngày 2/9/1945, Chủ tịch Hồ Chí Minh đọc Tuyên ngôn Độc lập.',
      ),
      _createLunarHoliday(
        year: year,
        lunarMonth: 8,
        lunarDay: 15,
        id: 'trung_thu',
        title: 'Tết Trung Thu',
        short: 'Tết thiếu nhi',
        long: 'Ngày rằm tháng Tám, ngày hội của trẻ em với đèn lồng và bánh nướng.',
        color: 0xFFFFA726,
      ),
      _createLunarHoliday(
        year: year,
        lunarMonth: 7,
        lunarDay: 15,
        id: 'vu_lan',
        title: 'Lễ Vu Lan',
        short: 'Ngày báo hiếu cha mẹ',
        long: 'Ngày lễ Phật giáo để tri ân đấng sinh thành.',
        color: 0xFF9C27B0,
      ),
    ];
  }

  static Holiday _createNationalHoliday({
    required String id,
    required String title,
    required DateTime date,
    required String short,
    required String long,
  }) {
    return Holiday(
      id: id,
      title: title,
      date: date,
      type: 'national',
      color: 0xFFD32F2F,
      shortDescription: short,
      longDescription: long,
      isHoliday: true,
      isLunarDate: false,
    );
  }

  static Holiday _createLunarHoliday({
    required int year,
    required int lunarMonth,
    required int lunarDay,
    required String id,
    required String title,
    required String short,
    required String long,
    int color = 0xFF424242,
    bool isMajor = false,
  }) {
    // Simplified lunar conversion for build
    final solarDate = DateTime(year, lunarMonth + 1, lunarDay);

    return Holiday(
      id: id,
      title: title,
      date: DateTime(solarDate.year, solarDate.month, solarDate.day),
      type: isMajor ? 'national' : 'cultural',
      color: color,
      shortDescription: short,
      longDescription: long,
      isHoliday: isMajor,
      isLunarDate: true,
    );
  }
}
