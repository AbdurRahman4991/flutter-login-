import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/services/register_email_veryfy_otp.dart';

class veryfiOtpForgetPassword extends StatefulWidget {
 final Map<String, dynamic>? arguments;

  const veryfiOtpForgetPassword({super.key, this.arguments});

  @override
  State<veryfiOtpForgetPassword> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<veryfiOtpForgetPassword> {
  List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());
  bool _isLoading = false;
  late final String email;

  @override
  void initState() {
    super.initState();
    email = widget.arguments?['email'] ?? 'Unknown Email';
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _submitOtp(String email) async {
    final otp = _otpControllers.map((c) => c.text).join();

    if (otp.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter complete OTP')),
      );
      return;
    }

    setState(() => _isLoading = true);

    final message = await OtpService.verifyOtp(email, otp);

    setState(() => _isLoading = false);

    if (message == "Email verified successfully") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message!)));
      Navigator.pushReplacementNamed(context, '/welcome');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message ?? "Verification failed")));
    }
  }

  /// ✅ ✅ ✅ এটি build মেথড যেখানে Scaffold থাকে:
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Verify forget password OTP",
                        style: TextStyle(color: Colors.white, fontSize: 40)),
                    Text("Welcome",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text('OTP sent to: $email'),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 6),
                            height: 68,
                            width: 50,
                            child: TextField(
                              controller: _otpControllers[index],
                              style: const TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.length == 1 && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _isLoading ? null : () => _submitOtp(email),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'Verify',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

