import 'package:http/http.dart' as http;
import 'dart:convert';

class LogoutApiService {
  static const String baseUrl = "http://192.168.20.203:4000/api";

  static Future<String> logout(String token) async {
    try {
      var url = Uri.parse('$baseUrl/logout');
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['message'] ?? "Logout successful";
      } else {
        return "Logout failed: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
