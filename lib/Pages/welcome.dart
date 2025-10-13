import 'package:flutter/material.dart';
import '/services/logout_api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Welcome extends StatelessWidget {
  
  final String? token; // nullable
  const Welcome({super.key, this.token});
 

Future<void> _logout(BuildContext context) async {
  // যদি token null হয়
  if (token == null || token!.isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("No token found")),
  );
  return;
}

  try {
    // Logout API call
    final response = await LogoutApiService.logout(token!);

    // Toast message দেখাবে
    Fluttertoast.showToast(
      msg: response,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );

    // যদি success থাকে তাহলে login page-এ redirect করবে
    if (response.toLowerCase().contains("success")) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  } catch (e) {
    // Error handle
    Fluttertoast.showToast(
      msg: "Logout failed: $e",
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue[900]!,
              Colors.blue[800]!,
              Colors.blue[400]!,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Text(
              "Welcome",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Glad to see you here!",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => _logout(context),
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

