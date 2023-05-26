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

    switch (grade[Random().nextInt(grade.length)]) {
        case 'A':
            print('Excellent!');
        break;
        case 'B':
            print('Good!');
        break;
        case 'C':
            print('Fair!');
        break;
        default:
            print('Need to improve!');
  }
}

```

### Now let's learn

```dart
```

### Now let's learn

```dart
```

### Now let's learn

```dart
```

### Now let's learn

```dart
```

### Now let's learn

```dart
```

### Now let's learn

```dart
```