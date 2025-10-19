import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgetPasswordApiService {
  static const String baseUrl = "http://192.168.20.203:4000/api";

  // Forgot Password API
  static Future<Map<String, dynamic>> sendResetLink(String email) async {
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

    var data = jsonDecode(response.body);
    return {
      "status": response.statusCode,
      "message": data['message'] ?? "No message",
    };
  } catch (e) {
    return {
      "status": 500,
      "message": "Error: $e",
    };
  }
}

}
