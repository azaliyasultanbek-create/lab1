void main() {
  String name = "Bekzat";
  int age = 25;
  double gpa = 3.4;
  bool isStudent = false;

  print("name : $name\nage: $age y.o.\ngpa: $gpa\nis Teacher: ${!isStudent}");

  String text1 = "Hello";
  String? text2 = null;
  print('text1: $text1');
  print('text2: $text2');

  int length1 = text1.length;
  int length2 = text2?.length ?? 0;
  print(length1);
  print(length2);

  String confirmedText = text2 ?? "default";
  print("confirmed $confirmedText length: ${confirmedText.length}");

  int digit = 3;
  print("MULTIPLICATION TABLE for digit $digit");
  for (int i = 1; i <= 10; i++) {
    print("$digit * $i = ${i * digit}");
  }

  for (int i = 10; i > 0; i--) {
    if (i % 2 == 0) {
      print("$i");
    } else {
      print("${i * 2}");
    }
  }

  //task1
  print("\nTask 1");
  for (int d = 1; d <= 10; d++) {
    print("\nTable for $d:");
    for (int i = 1; i <= 10; i++) {
      print("$d * $i = ${d * i}");
    }
  }

  //task2
  print("\nTask 2");
  print(nextDay("05.09.2026"));
  print(nextDay("28.02.2024"));
  print(nextDay("28.02.2026"));
  print(nextDay("29.02.2026"));
  print(nextDay("28.02.2100"));
  print(nextDay("31.12.2025"));

  //task3
  print("\nTask 3");
  String targetText = "flutter mobile development";
  print('Text: "$targetText" -> Vowel count: ${countVowels(targetText)}');

  //task4
  print("\nTask 4");
  List<int> numbers = [14, 88, 3, 42, 99, 12, 67];
  List<int> numbers1 = [234, 34, 123, 44, 949, 112, 67];
  findMinMax(numbers);
  findMinMax(numbers1);

  //task5
  print("\nTask 5");
  print("3 -> ${isPrime(3) ? "prime number" : "not prime number"}");
  print("6 -> ${isPrime(6) ? "prime number" : "not prime number"}");
}

//task2
bool isLeapYear(int year) {
  if (year % 400 == 0) return true;
  if (year % 100 == 0) return false;
  return year % 4 == 0;
}

int getDaysInMonth(int month, int year) {
  switch (month) {
    case 1: case 3: case 5: case 7: case 8: case 10: case 12:
    return 31;
    case 4: case 6: case 9: case 11:
    return 30;
    case 2:
      return isLeapYear(year) ? 29 : 28;
    default:
      return 0;
  }
}

String nextDay(String date) {
  List<String> parts = date.split(".");
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int year = int.parse(parts[2]);

  int daysInMonth = getDaysInMonth(month, year);
  if (day < daysInMonth) {
    day++;
  } else if (day == daysInMonth) {
    day = 1;
    if (month == 12) {
      month = 1;
      year++;
    } else {
      month++;
    }
  } else {
    return "Invalid date";
  }
  return "${day.toString().padLeft(2, '0')}.${month.toString().padLeft(2, '0')}.$year";
}

//task3
int countVowels(String text) {
  String vowels = "aeiouAEIOU";
  int count = 0;
  for (int i = 0; i < text.length; i++) {
    if (vowels.contains(text[i])) {
      count++;
    }
  }
  return count;
}

//task4
void findMinMax(List<int> list) {
  if (list.isEmpty) return;
  int minVal = list[0];
  int maxVal = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] < minVal) minVal = list[i];
    if (list[i] > maxVal) maxVal = list[i];
  }
  print("List: $list -> max: $maxVal, min: $minVal");
}

//task5
bool isPrime(int n) {
  if (n <= 1) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}