import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class VerifyOtp extends StatelessWidget {

  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('OTP sent to'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  height: 68,
                  width: 64,
                  child: TextField(
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                      
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // এখানে verify OTP API কল করবে
              },
              child: const Text('Verify'),
            )
          ],
        ),
      ),
    );
  }
}
