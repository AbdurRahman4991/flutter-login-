import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "http://192.168.20.203:4000/api";

  static Future<String?> registerUser(
      String name, String email, String password, String confirmPassword) async {
    try {
      var url = Uri.parse('$baseUrl/register');
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        }),
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        // ✅ Success
        return data['message'];
      } else if (response.statusCode == 422) {
        // ✅ Laravel validation error
        if (data['errors'] != null) {
          // একাধিক error থাকলে প্রথমটা show করবে
          final firstError = data['errors'].values.first[0];
          return firstError;
        }
        return data['message'] ?? "Validation failed";
      } else {
        return data['message'] ?? "Something went wrong";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
