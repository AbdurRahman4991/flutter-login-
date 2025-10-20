import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginOtpService {
  static Future<Map<String, dynamic>> verifyOtpLogin({
    required String email,
    required String otp,
  }) async {
    final url = Uri.parse('http://192.168.20.203:4000/api/verify-otp-login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'otp': otp,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {
        'success': true,
        'token': data['access_token'],
        'user': data['user'],
      };
    } else {
      return {
        'success': false,
        'message': data['message'] ?? 'OTP verification failed',
      };
    }
  }
}
