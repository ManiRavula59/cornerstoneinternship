(String, int, double, String, String, bool) evaluateStudent(
    String name, int mark, double attendance) {

  String grade;
  String remark;

  if (mark >= 90) {
    grade = "A";
    remark = "Excellent";
  } else if (mark >= 75) {
    grade = "B";
    remark = "Very Good";
  } else if (mark >= 60) {
    grade = "C";
    remark = "Good";
  } else if (mark >= 40) {
    grade = "D";
    remark = "Pass";
  } else {
    grade = "F";
    remark = "Fail";
  }

  bool eligible = mark >= 40 && attendance >= 75;

  return (name, mark, attendance, grade, remark, eligible);
}

void main() {
  var result = evaluateStudent("Ravi", 78, 82.5);

  print("Name: ${result.$1}");
  print("Mark: ${result.$2}");
  print("Attendance: ${result.$3}%");
  print("Grade: ${result.$4}");
  print("Remark: ${result.$5}");
  print("Eligible for next level: ${result.$6}");
}