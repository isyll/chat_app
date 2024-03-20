import 'dart:math';

DateTime generateRandomDateTime(DateTime minDate, DateTime maxDate) {
  final random = Random();
  final diff = maxDate.difference(minDate).inSeconds;
  final randomSeconds = random.nextInt(diff);
  return minDate.add(Duration(seconds: randomSeconds));
}

DateTime generateRandomDateTimeWithinOneYear() {
  final now = DateTime.now();
  final minDate = DateTime(now.year - 1, now.month, now.day);
  final maxDate = now;
  return generateRandomDateTime(minDate, maxDate);
}
