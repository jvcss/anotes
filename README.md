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
    int age = 17;
    double height = 1.75;
    String name = 'John Doe';
    bool isStudent = true;
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
        var first = '$name is not a minor${isStudent ? ' and is a student.' : ' and is not a student.'}';
        var second = 'His height is ${height.toStringAsFixed(2)}';
        print('$first\n$second');
    } else {
        var first = '$name is a minor${isStudent ? ' and is a student.' : ' and is not a student.'}';
        var second = 'His height is ${height.toStringAsFixed(2)}';
        print('$first\n$second');
    }

    for (var fruit in fruits) {
        print('I like $fruit');
    }

    int i = 0;
    while (i < fruits.length) {
        print(fruits[i]);
        i++;
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

### Now let's learn

```dart
```