class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void displayInfo() {
    print("Name: $name, Age: $age");
  }
}

class Student extends Person {
  int rollNo;

  Student(String name, int age, this.rollNo) : super(name, age);

  void study() {
    print("$name is studying");
  }
}

class Teacher extends Person {
  String subject;

  Teacher(String name, int age, this.subject) : super(name, age);

  void teach() {
    print("$name is teaching $subject");
  }
}

void main() {
  Student s1 = Student("Anita", 16, 101);
  Teacher t1 = Teacher("Mr. Rao", 40, "Maths");

  s1.displayInfo();
  s1.study();

  t1.displayInfo();
  t1.teach();
}