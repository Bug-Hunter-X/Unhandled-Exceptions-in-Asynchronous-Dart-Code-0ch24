```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        return jsonData; 
      } catch (e) {
        print('Error decoding JSON: $e');
        return null; // Or throw a custom exception
      }
    } else {
      print('Error: HTTP request failed with status: ${response.statusCode}');
      return null; // Or throw a custom exception
    }
  } catch (e) {
    print('Network error: $e');
    return null; // Or throw a custom exception
  }
}

void main() async {
  final data = await fetchData();
  if (data != null) {
    print(data['key']);
  } 
}
```