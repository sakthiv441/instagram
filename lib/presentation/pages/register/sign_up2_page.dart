import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/presentation/pages/register/sign_up_page.dart';
import 'package:instagram/presentation/pages/register/widgets/email_verification.dart';
import 'package:instagram/presentation/pages/register/widgets/name_password.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/utility/constant.dart';
import '../../widgets/global/custom_widgets/custom_elevated_button.dart';
import '../../widgets/global/custom_widgets/custom_text_field.dart';

class Signuppage2 extends StatefulWidget {
  const Signuppage2({super.key});

  @override
  State<Signuppage2> createState() => _Signuppage2State();
}

class _Signuppage2State extends State<Signuppage2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              'Enter Phone or Email',
              style: TextStyle(
                  letterSpacing: -0.5,
                  fontSize: 27,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: tabBarIcons(_tabController),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: Divider(
                thickness: 0.5,
                height: 0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            tapBarView(_tabController),

            const SizedBox(
              height: 10,
            ),
            // PhoneNumberTextField()
          ],
        ),
      )),
    );
  }

  Expanded tapBarView(TabController _tabController) {
    return Expanded(
        child: TabBarView(
      controller: _tabController,
      children: const [
        Center(child: EmailField()),
        Center(child: PhoneNumberTextField())
      ],
    ));
  }

  TabBar tabBarIcons(TabController _tabController) {
    bool isWidthAboveMinimum = MediaQuery.of(context).size.width > 800;
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.grey,
      unselectedLabelColor: ColorManager.grey,
      labelColor: isWidthAboveMinimum
          ? ColorManager.black
          : (isThatMobile ? Theme.of(context).focusColor : ColorManager.blue),
      indicatorSize: isThatMobile ? null : TabBarIndicatorSize.label,
      labelPadding: isWidthAboveMinimum
          ? const EdgeInsetsDirectional.only(
              start: 50, end: 50, top: 5, bottom: 3)
          : null,
      indicatorWeight: isWidthAboveMinimum ? 2 : (isThatMobile ? 2 : 0),
      tabs: [
        Tab(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Email',
                style: TextStyle(
                  letterSpacing: -0.5,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isWidthAboveMinimum) ...[
                const SizedBox(width: 8),
                Text(
                  StringsManager.postsCap.tr,
                ),
              ],
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Phone',
                style: TextStyle(
                  letterSpacing: -0.5,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isWidthAboveMinimum) ...[
                const SizedBox(width: 8),
                Text(StringsManager.reels.tr),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  ValueNotifier<bool> validateEmail = ValueNotifier(false);
  final emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: CustomTextField(
            hint: StringsManager.email.tr,
            controller: emailcontroller,
            validate: validateEmail,
            isThatEmail: true,
          ),
        ),
        customTextButton(),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
            child: Text(
              textAlign: TextAlign.center,
              'You My Recive Email and updates from Instagram and can change it any time',
              style: getNormalStyle(color: ColorManager.grey, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }

  Widget customTextButton() {
    return ValueListenableBuilder(
      valueListenable: validateEmail,
      builder: (context, bool validateEmailValue, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
          child: CustomElevatedButton(
            isItDone: true,
            isThatSignIn: true,
            nameOfButton: StringsManager.next.tr,
            blueColor: validateEmailValue ? true : false,
            onPressed: () async {
              if (validateEmailValue) {
                pushToPage(context,
                    page: VerificationScreen(email: emailcontroller.text),
                    withoutRoot: false,
                    withoutPageTransition: true);
              }
            },
          ),
        );
      },
    );
  }
}

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneNumberTextFieldState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  final TextEditingController _phoneController = TextEditingController();
  ValueNotifier<bool> validatePhone = ValueNotifier(false);

  String _selectedCountryCode = 'US +1';

  final List<String> _countryCodes = [
    'US +1', // United States
    'UK +44', // United Kingdom
    'IN +91', // China
    // Add more country codes here...
  ];

  String? errorMassage;
  @override
  void initState() {
    _phoneController.addListener(() {
      if (_phoneController.text.isNotEmpty) {
        _validateNumber();
      } else {
        errorMassage = null;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
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
                      prefixIcon: SizedBox(
                        width: 86,
                        child: DropdownButtonFormField<String>(
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          value: _selectedCountryCode,
                          items: _countryCodes
                              .map((code) => DropdownMenuItem<String>(
                                    value: code,
                                    child: Text(
                                      code,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.blue),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCountryCode = value!;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(48, 232, 232, 232),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
          child: ValueListenableBuilder(
              valueListenable: validatePhone,
              builder: (BuildContext context, value, Widget? child) {
                return CustomElevatedButton(
                  blueColor: value ? true : false,
                  isThatSignIn: true,
                  isItDone: true,
                  nameOfButton: 'Next',
                  onPressed: () async {},
                );
              }),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
            child: Text(
              textAlign: TextAlign.center,
              'You My Recive SMS and updates from Instagram , Work under progress please signup with email id',
              style: getNormalStyle(color: ColorManager.grey, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }

  String? _validateNumber() {
    if (_phoneController.text == null || _phoneController.text.isEmpty) {
      return 'Please enter a number';
    }
    final number = num.tryParse(_phoneController.text);
    if (number == null) {
      return 'Please enter a valid number';
    }
    return null; // Return null if input is valid
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(isThatMobile ? 5.0 : 1.0),
      borderSide: BorderSide(
          color: ColorManager.lightGrey, width: isThatMobile ? 1.0 : 0.3),
    );
  }
}
