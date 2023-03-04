import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/presentation/pages/register/login_page.dart';
import 'package:instagram/presentation/pages/register/sign_up2_page.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/resources/assets_manager.dart';
import '../../widgets/global/custom_widgets/custom_elevated_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                IconsAssets.instagramLogo,
                color: Theme.of(context).focusColor,
                height: 50,
              ),
              const SizedBox(height: 15),
              CustomElevatedButton(
                isItDone: true,
                nameOfButton: 'Create New Account',
                onPressed: () async {
                  pushToPage(context, page: const Signuppage2());
                },
              ),
              TextButton(
                  onPressed: () {
                    pushToPage(context, page: const LoginPage());
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const LoginPage()));
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
