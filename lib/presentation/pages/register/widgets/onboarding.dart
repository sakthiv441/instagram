import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key, this.onpressed});
  final VoidCallback? onpressed;
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Onboarding'),
        ),
        body: SafeArea(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Add Your Name',
                    style: TextStyle(
                        letterSpacing: -0.5,
                        fontSize: 27,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Add you name so friends can find you',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: widget.onpressed, child: Text('Tap')),
                ],
              ),
            ),
          ),
        ));
  }
}
