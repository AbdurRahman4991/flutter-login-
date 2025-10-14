import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgetPasswordApiService {
  static const String baseUrl = "http://192.168.20.203:4000/api";

  // Forgot Password API
  static Future<String> sendResetLink(String email) async {
    try {
      var url = Uri.parse("$baseUrl/password/forgot");
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({"email": email}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['message'] ?? "Reset link sent successfully!";
      } else {
        var data = jsonDecode(response.body);
        return data['message'] ?? "Failed to send reset link.";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
