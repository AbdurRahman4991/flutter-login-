// import 'package:flutter/material.dart';
// import '/services/reset_password_api_service.dart';

// class ResetPassword extends StatefulWidget {
//   final Map<String, dynamic>? arguments;
//   const ResetPassword({super.key, this.arguments});

//   @override
//   State<ResetPassword> createState() => _ResetPasswordState();
// }

// class _ResetPasswordState extends State<ResetPassword> {
//   final emailController = TextEditingController();
//   final otpController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     otpController.dispose();
//     passwordController.dispose();
//     confirmController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             colors: [
//               Colors.blue[900]!,
//               Colors.blue[800]!,
//               Colors.blue[400]!,
//             ],
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 60),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Reset Password",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "Please enter your details",
//                     style: TextStyle(color: Colors.white70, fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(60),
//                     topRight: Radius.circular(60),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 30),
//                       _buildInputField("Email address", controller: emailController),
//                       const SizedBox(height: 20),
//                       _buildInputField("OTP", controller: otpController),
//                       const SizedBox(height: 20),
//                       _buildInputField("New Password",
//                           isPassword: true, controller: passwordController),
//                       const SizedBox(height: 20),
//                       _buildInputField("Confirm Password",
//                           isPassword: true, controller: confirmController),
//                       const SizedBox(height: 40),

//                       // ✅ Reset Password button
//                       GestureDetector(
//                         onTap: () async {
//                           if (passwordController.text != confirmController.text) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text("Passwords do not match")),
//                             );
//                             return;
//                           }

//                           final result = await ResetPasswordService.resetPassword(
//                             email: emailController.text.trim(),
//                             otp: otpController.text.trim(),
//                             password: passwordController.text,
//                             confirmPassword: confirmController.text,
//                           );

//                           // ✅ Show message
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text(result)),
//                           );

//                           // ✅ যদি রিসেট সফল হয় তাহলে লগইনে রিডাইরেক্ট করবে
//                           if (result.toLowerCase().contains("success")) {
//                             Future.delayed(const Duration(seconds: 1), () {
//                               Navigator.pushReplacementNamed(context, '/');
//                             });
//                           }
//                         },
//                         child: Container(
//                           height: 50,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: Colors.blue[800],
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               "Reset Password",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 20),

//                       // ✅ Back to Login button
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushReplacementNamed(context, '/');
//                         },
//                         child: Text(
//                           "Back to Login",
//                           style: TextStyle(color: Colors.grey[600], fontSize: 14),
//                         ),
//                       ),

//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField(String hint,
//       {bool isPassword = false, required TextEditingController controller}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           hintText: hint,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '/services/reset_password_api_service.dart';

class ResetPassword extends StatefulWidget {
  final Map<String, dynamic>? arguments;
  const ResetPassword({super.key, this.arguments});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 🔹 Forget Password থেকে ইমেইল এলে সেট করে দাও
    if (widget.arguments != null && widget.arguments!['email'] != null) {
      emailController.text = widget.arguments!['email'];
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Please enter your details",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      // 🔹 ইমেইল ফিল্ড read-only করা হয়েছে
                      _buildInputField("Email address",
                          controller: emailController, readOnly: true),
                      const SizedBox(height: 20),
                      _buildInputField("OTP", controller: otpController),
                      const SizedBox(height: 20),
                      _buildInputField("New Password",
                          isPassword: true, controller: passwordController),
                      const SizedBox(height: 20),
                      _buildInputField("Confirm Password",
                          isPassword: true, controller: confirmController),
                      const SizedBox(height: 40),

                      GestureDetector(
                        onTap: () async {
                          if (passwordController.text != confirmController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Passwords do not match")),
                            );
                            return;
                          }

                          final result = await ResetPasswordService.resetPassword(
                            email: emailController.text.trim(),
                            otp: otpController.text.trim(),
                            password: passwordController.text,
                            confirmPassword: confirmController.text,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(result)),
                          );

                          if (result.toLowerCase().contains("success")) {
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.pushReplacementNamed(context, '/');
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Reset Password",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        child: Text(
                          "Back to Login",
                          style: TextStyle(color: Colors.grey[600], fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String hint,
      {bool isPassword = false,
      required TextEditingController controller,
      bool readOnly = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        readOnly: readOnly,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
}
