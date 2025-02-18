```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data')).timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Use the data
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  } on TimeoutException catch (e) {
    print('Timeout error: $e');
    // retry or handle timeout
  } on SocketException catch (e) {
    print('Network error: $e');
    // Handle Network issues
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; //Re-throw for upper level handling
  }
}

Future<void> main() async {
  try {
    await fetchData();
  } catch (e) {
    print('Error in main: $e');
    // Handle the error appropriately for the app
  }
}
```