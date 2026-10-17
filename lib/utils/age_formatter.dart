String formatCatAge(int age) {
  final m = age % 100;
  final n1 = m % 10;

  if (m > 10 && m < 20) {
    return '$age лет';
  }
  if (n1 > 1 && n1 < 5) {
    return '$age года';
  }
  if (n1 == 1) {
    return '$age год' ;
  }
  return '$age лет';
}