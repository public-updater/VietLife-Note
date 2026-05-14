class StringUtils {
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static String normalizeForSearch(String text) {
    if (text.isEmpty) return text;
    
    final Map<String, String> vietnameseMap = {
      'a': 'á|à|ả|ã|ạ|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ',
      'A': 'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ằ|Ẳ|Ẵ|Ặ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
      'd': 'đ',
      'D': 'Đ',
      'e': 'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
      'E': 'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
      'i': 'í|ì|ỉ|ĩ|ị',
      'I': 'Í|Ì|Ỉ|Ĩ|Ị',
      'o': 'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
      'O': 'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
      'u': 'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
      'U': 'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
      'y': 'ý|ỳ|ỷ|ỹ|ỵ',
      'Y': 'Ý|Ỳ|Ỷ|Ỹ|Ỵ'
    };

    String result = text;
    for (final entry in vietnameseMap.entries) {
      final RegExp regex = RegExp(entry.value);
      result = result.replaceAll(regex, entry.key);
    }
    
    return result.toLowerCase();
  }
}
