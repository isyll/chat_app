String truncateString(String str, int maxLen) {
  if (str.length > maxLen) {
    return '${str.substring(0, maxLen)}…';
  } else {
    return str;
  }
}
