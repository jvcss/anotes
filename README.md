# anotes

<p > A Flutter app to test endpoints.</p>

---
## Getting Started

### Now let's learn all features that Dard support 

```dart
// You can import libraries
// Such as build-in and external
//import 'dart:io';
import 'dart:math';
// Importing external libraries
import 'package:http/http.dart' as http;
// Dart supports both single-line and multi-line comments.

// Dart has a strong type system, 
// but it also supports type inference.
void main() {
  print('Hello, Dart!');

  demonstrateVariablesAndConstants();
  demonstrateDataTypes();
  demonstrateControlFlow();
  demonstrateFunctions();
  demonstrateClassesAndObjects();
  demonstrateExceptionHandling();
  demonstrateAsyncProgramming();
  demonstrateExternalLibrary();
}
```

### Now let's learn Variables And Constants 

```dart
void demonstrateVariablesAndConstants(){
    var dynamicVariable = 'I am a dynamic variable';
    print(dynamicVariable);
    dynamicVariable = 'It means I can be changed!\n';
    print(dynamicVariable);

    final constantVariable = 42;
    print('This is a template using an immutable variable: $constantVariable\n');
}
```

### Now let's learn Data types

```dart
void demonstrateDataTypes() {
    int age = Random().nextInt(91) + 12; // Value is >= 12 and < 103.;
    double height = 1.75;
    String name = 'John Doe';
    bool isStudent = Random().nextBool();
    List<String> fruits = ['apple', 'banana', 'orange'];
    Map<String, dynamic> person = {'name': 'Alice', 'age': 30, 'isEmployed': true};

    String buildManyInOneLine(List<dynamic> list){
        String newString = '';
        for (int count = 0; count < list.length; count++){
            newString += "${list[count]}";
        }
        return newString;
    }
    
    if (age >= 18) {
        var first = '$name is not a minor${isStudent ? 
          ' and is a student.' : ' and is not a student.'}';
        var second = 'His height is ${height.toStringAsFixed(2)}';
        
        List<dynamic> listing = [first, second];
        print(buildManyInOneLine(listing));
    } else {
        var first = '$name is a minor${isStudent ? ' and is a student.' : ' and is not a student.'}';
        var second = 'His height is ${height.toStringAsFixed(2)}';
        
        print(buildManyInOneLine([first, second]));
    }

    for (var fruit in fruits) {
        print('${person['name']} loves $fruit and have ${person['age']} ' +
              'years old and ${person['isEmployed']? 
              "have a job!": "don't have a job yet."}');
    }

    int i = 0;
    while (i < fruits.length) {
        print(fruits[i]);
        i++;
    }
}
```

### Now let's learn Control Flow

```dart
void demonstrateControlFlow() {
  var grade = ['A', 'B', 'C', 'D'];
  
  String got = grade[Random().nextInt(grade.length)];

  switch (got) {
      case 'A':
        print('$got is Excellent!');
      break;
      case 'B':
        print('$got is Good!');
      break;
      case 'C':
        print('$got is Fair!');
      break;
      default:
        print('$got Need to improve!');
  }
}

```

### Now let's learn Functions

```dart
void demonstrateFunctions() {
    int multiply(int a, int b) {
        return a * b;
    }
    void greet(String name, {String prefix = 'Hello', String? suffix}) {
        print('$prefix, $name! $suffix');
    }

    print('5 * 3 = ${multiply(5, 3)}');

    greet('Bob', prefix: 'Hi', suffix: 'How are you?');
}
```

### Now let's learn Classes And Objects

```dart
void demonstrateClassesAndObjects() {

    var person1 = Person('Alice', 30, true);

    person1.introduce();

    var vector1 = Vector(2, 3);
    var vector2 = Vector(4, 5);
    var vectorSum = vector1 + vector2;
    var vectorScaled = vectorSum * 2;
    print('Vector sum: (${vectorSum.x}, ${vectorSum.y})');
    print('Scaled vector: (${vectorScaled.x}, ${vectorScaled.y})');

    var logger = Logger();
    logger.logMessage();

    var deprecatedClass = DeprecatedClass();
    deprecatedClass.deprecatedMethod();

    var callable = CallableClass();
    callable('Hello from callable class');

    try {
        var data = Data(null);
        print('Data value: ${data.value}');
    } catch (e) {
        print('An error occurred: $e');
    }
}
// Dart supports classes and objects.
class Person {
  late String name;
  int age;
  bool isHired;

  Person(this.name, this.age, this.isHired);

  void introduce() {
    print('My name is $name, and I am $age years old.');
    if (isHired)
      print('And I have a job as a Software Developer');
    else
      print('And I\'m seeking for a job!');
  }
}
// Defining a class with operator overloading
class Vector {
  double x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector other) {
    return Vector(x + other.x, y + other.y);
  }

  Vector operator *(double scalar) {
    return Vector(x * scalar, y * scalar);
  }
}
// Defining a mixin
mixin Loggable {
  void logs(String message) {
    print('[LOG] $message');
  }
}
// Using a mixin
class Logger with Loggable {
  void logMessage() {
    logs('Logging a message');
  }
}
// Defining a class with metadata
@deprecated
class DeprecatedClass {
    @deprecated
    void deprecatedMethod() {
        print('This method is deprecated.');
    }
}
class CallableClass {
  void call(String message) {
    print('Calling: $message');
  }
}
class Data {
  String? value;

  Data(this.value) {
    if (value == null) {
      throw ArgumentError.notNull('value');
    }
  }
}
```

### Now let's learn Exception Handling

```dart
void demonstrateExceptionHandling() {
  divide(10, 2);
  divide(10, 0);
}

void divide(int a, int b) {
  try {
    var result = a ~/ b;
    print('Result: $result');
  } catch (e) {
    print('An error occurred: $e');
  }
}
```

### Now let's learn Async Programming

```dart
void demonstrateAsyncProgramming() {
  fetchData();
}

Future<void> fetchData() async {
  print('Fetching data...');
  await Future.delayed(Duration(seconds: 2));
  print('Data fetched!');
}
```

### Now let's learn External Library

```dart
void demonstrateExternalLibrary() {
  http.get(Uri.https('example.com', 'whatsit/create')).then((response) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  });
}
```