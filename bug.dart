```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Use the data 
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handle exceptions
    print('Error: $e');
    rethrow; // Re-throw to handle in calling function
  }
}
```