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

---

# Flutter Learning Path ✅ / ⬜

## 1. Introduction to Flutter
- Overview of Flutter and its advantages.
- Setting up the development environment.
- Understanding the Flutter architecture and widget tree.

## 2. Dart Programming Language
- Basics of Dart programming language.
- Variables, data types, and control flow.
- Functions, classes, and object-oriented programming in Dart.

## 3. Flutter Widgets
- Exploring the core widgets provided by Flutter.
- Working with text, images, buttons, and layouts.
- Understanding widget composition and building custom widgets.

## 4. Navigation and Routing
- Navigating between screens and managing routes.
- Passing data between screens.
- Implementing navigation patterns like tabs and drawers.

## 5. State Management
- Introduction to state management and its importance in Flutter.
- Understanding the concept of mutable and immutable widgets.
- Exploring different state management approaches in Flutter:
  - setState and InheritedWidget for simple cases.
  - Provider package for dependency injection and state management.
  - BLoC (Business Logic Component) pattern with the Flutter BLoC library.
  - MobX for reactive state management.
  - Redux for managing app state using a centralized store.

## 6. Networking and API Integration
- Making HTTP requests and handling responses.
- Parsing JSON data and working with REST APIs.
- Using popular libraries like Dio or http for networking tasks.

## 7. Persistence and Data Storage
- Working with local databases and key-value stores.
- Using SQLite or NoSQL databases like Hive or Moor.
- Implementing data caching and offline support.

## 8. Working with External Libraries
- Introduction to popular external libraries commonly used in Flutter projects:
  - Flutter Material Design widgets for building beautiful UIs.
  - Flutter Cupertino widgets for iOS-specific UI elements.
  - Firebase for backend services like authentication, cloud storage, and more.
  - Flutter animations libraries like Rive (formerly Flare) or Flutter Animation.
  - Image loading and caching libraries like CachedNetworkImage or Flutter Image.
  - Package management and dependency injection with Pub and GetIt.

## 9. Testing and Debugging
- Writing unit tests and widget tests.
- Debugging techniques and using Flutter DevTools for performance analysis.
- Handling errors and exceptions.

## 10. Deployment and Publishing
- Preparing the app for production.
- Building release versions for Android and iOS.
- Publishing the app to the Google Play Store and Apple App Store.
