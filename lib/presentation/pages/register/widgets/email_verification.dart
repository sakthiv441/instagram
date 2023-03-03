import 'dart:async';

import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:instagram/core/utility/constant.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../widgets/global/custom_widgets/custom_elevated_button.dart';
import 'name_password.dart';

//emailAuth.config(remoteServerConfiguration); add your server config to run send email verification code
class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  bool _isButtonDisabled = true;
  int _remainingTime = 60;
  bool _resendButtonDisabled = true;
  final EmailAuth _emailAuth = EmailAuth(sessionName: "My App");

  @override
  void initState() {
    super.initState();
    _sendOTP();
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_remainingTime < 1) {
          _resendButtonDisabled = false;
          timer.cancel();
        } else {
          _remainingTime -= 1;
        }
      });
    });
  }

  void _sendOTP() async {
    var res = await _emailAuth.sendOtp(recipientMail: widget.email);
    if (res) {
      print("OTP sent to ${widget.email}");
    } else {
      print("Could not send OTP to ${widget.email}");
    }
  }

  Future<void> _verifyOTP() async {
    bool verified = await _emailAuth.validateOtp(
      userOtp: _otpController.text,
      recipientMail: widget.email,
    );
    if (verified) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const NamePassword()),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid OTP! Please try again.'),
        ),
      );
    }
  }

  void _resendOTP() {
    setState(() {
      _sendOTP();
      _remainingTime = 60;
      _resendButtonDisabled = true;
      _isButtonDisabled = true;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 27,
            )),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Enter Confirmation Code',
                style: TextStyle(
                    letterSpacing: -0.5,
                    fontSize: 27,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Enter the confirmation code we sent to ${widget.email}.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _resendButtonDisabled ? null : _resendOTP,
                    child: const Text(
                      'Resend Confirmation Code',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  autofocus: true,
                  cursorColor: ColorManager.teal,
                  style: getNormalStyle(
                      color: Theme.of(context).focusColor, fontSize: 15),
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: isThatMobile
                        ? getNormalStyle(
                            color: Theme.of(context).indicatorColor)
                        : getNormalStyle(
                            color: ColorManager.black54, fontSize: 12),
                    filled: true,
                    focusedBorder: outlineInputBorder(),
                    enabledBorder: outlineInputBorder(),
                    errorStyle: getNormalStyle(color: ColorManager.red),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: isThatMobile ? 15 : 5),
                  ),
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Verification code is required.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _isButtonDisabled = value.length < 6;
                    });
                  },
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: CustomElevatedButton(
                  isThatSignIn: true,
                  isItDone: true,
                  nameOfButton: 'Next',
                  onPressed: () async {
                    _isButtonDisabled ? null : _verifyOTP;
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(isThatMobile ? 5.0 : 1.0),
      borderSide: BorderSide(
          color: ColorManager.lightGrey, width: isThatMobile ? 1.0 : 0.3),
    );
  }
}
