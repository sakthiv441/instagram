import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/presentation/pages/register/sign_up_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/resources/color_manager.dart';

import '../../../../core/resources/styles_manager.dart';
import '../../../../core/utility/constant.dart';
import '../../../widgets/global/custom_widgets/custom_elevated_button.dart';
import '../../../widgets/global/custom_widgets/custom_text_field.dart';
import '../sign_up2_page.dart';

// ignore: must_be_immutable
class NamePassword extends StatefulWidget {
  const NamePassword({super.key, required this.emailcontroller});
  final TextEditingController emailcontroller;

  @override
  State<NamePassword> createState() => _NamePasswordState();
}

class _NamePasswordState extends State<NamePassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _namecontroller = TextEditingController();
  @override
  void dispose() {
    _namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: CustomTextField(
                    hint: 'Full Name',
                    controller: _namecontroller,
                  ),
                ),
                const SizedBox(height: 5),
                customTextButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: CustomElevatedButton(
        isItDone: true,
        isThatSignIn: true,
        nameOfButton: 'Next',
        blueColor: true,
        onPressed: () async {
          if (_namecontroller.text.isNotEmpty) {
            pushToPage(context,
                page: PasswordScreen(
                  emailcontroller: widget.emailcontroller,
                  fullnamecontroller: _namecontroller,
                ),
                withoutRoot: false,
                withoutPageTransition: true);
          }
        },
      ),
    );
  }
}

class PasswordScreen extends StatefulWidget {
  const PasswordScreen(
      {super.key,
      required this.emailcontroller,
      required this.fullnamecontroller});
  final TextEditingController emailcontroller;

  final TextEditingController fullnamecontroller;
  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _Passwordcontroller = TextEditingController();

  ValueNotifier<bool> validatePassword = ValueNotifier(false);

  ValueNotifier<bool> rememberPassword = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  'Create a password',
                  style: TextStyle(
                      letterSpacing: -0.5,
                      fontSize: 27,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    'We can remmember the password so you wont need to to enter it on your icolud',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: CustomTextField(
                    hint: 'Password',
                    controller: _Passwordcontroller,
                    isThatEmail: false,
                    validate: validatePassword,
                  ),
                ),
                const SizedBox(height: 5),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isThatMobile ? 4 : 0,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 13),
                        ValueListenableBuilder(
                          valueListenable: rememberPassword,
                          builder: (context, bool rememberPasswordValue,
                                  child) =>
                              Checkbox(
                                  value: rememberPasswordValue,
                                  activeColor: isThatMobile
                                      ? ColorManager.white
                                      : ColorManager.blue,
                                  fillColor: isThatMobile
                                      ? MaterialStateProperty.resolveWith(
                                          (Set states) {
                                          if (states.contains(
                                              MaterialState.disabled)) {
                                            return Colors.blue.withOpacity(.32);
                                          }
                                          return Colors.blue;
                                        })
                                      : null,
                                  onChanged: (value) => rememberPassword.value =
                                      !rememberPasswordValue),
                        ),
                        Text(
                          'Save Password',
                          style: getNormalStyle(
                              color: Theme.of(context).focusColor),
                        )
                      ],
                    ),
                  ),
                ),
                customTextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextButton() {
    return ValueListenableBuilder(
      valueListenable: rememberPassword,
      builder:
          (BuildContext context, bool rememberPasswordValue, Widget? child) =>
              ValueListenableBuilder(
        valueListenable: validatePassword,
        builder: (context, bool validatePassword, child) {
          bool validate = validatePassword && rememberPasswordValue;
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
            child: CustomElevatedButton(
              isItDone: true,
              isThatSignIn: true,
              nameOfButton: 'Next',
              blueColor: validate ? true : false,
              onPressed: () async {
                if (validatePassword) {
                  pushToPage(context,
                      page: DateOfBirth(
                        emailcontroller: widget.emailcontroller,
                        fullnamecontroller: widget.fullnamecontroller,
                        passwordcontroller: _Passwordcontroller,
                      ),
                      withoutRoot: false,
                      withoutPageTransition: true);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class DateOfBirth extends StatefulWidget {
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  final TextEditingController fullnamecontroller;

  const DateOfBirth(
      {super.key,
      required this.emailcontroller,
      required this.passwordcontroller,
      required this.fullnamecontroller});

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();

  late DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/splash/Asset 1@2x.png')),
                const Text(
                  'Add Your Birthday',
                  style: TextStyle(
                      letterSpacing: -0.5,
                      fontSize: 27,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 3),
                  child: Text(
                    'This wont be part of your public profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    'Why do I need to provide my date of birth',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.none,
                          controller: _dateController,
                          cursorColor: ColorManager.teal,
                          style: getNormalStyle(
                              color: Theme.of(context).focusColor,
                              fontSize: 15),
                          decoration: InputDecoration(
                            hintText: 'December 27, 1999',
                            hintStyle: isThatMobile
                                ? getNormalStyle(
                                    color: Theme.of(context).indicatorColor)
                                : getNormalStyle(
                                    color: ColorManager.black54, fontSize: 12),
                            filled: true,
                            focusedBorder: outlineInputBorder(),
                            enabledBorder: outlineInputBorder(),
                            // suffixIcon: IconButton(
                            //     onPressed: () {},
                            //     icon: const Icon(Icons.calendar_today)),
                            errorStyle: getNormalStyle(color: ColorManager.red),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: isThatMobile ? 15 : 5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 3, child: SizedBox(height: 5)),
                const Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
                  child: Text(
                    'Use your own birthday. Even this account is for business, a pet or something',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey[350],
                  ),
                ),
                customTextButton(context, widget.emailcontroller,
                    widget.fullnamecontroller, widget.passwordcontroller),
                Expanded(
                  flex: 3,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 250,
                        child: CupertinoTheme(
                          data: const CupertinoThemeData(
                            textTheme: CupertinoTextThemeData(
                              dateTimePickerTextStyle:
                                  TextStyle(color: Colors.black, fontSize: 22),
                            ),
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: _selectedDate,
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() {
                                _selectedDate = newDate;
                                _dateController.text =
                                    DateFormat.yMMMMd().format(newDate);
                              });
                            },
                            minimumYear: 1990,
                            maximumYear: 2500,
                          ),
                        ),
                      )),
                ),
              ],
            ),
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

  Widget customTextButton(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController fullNameController,
      TextEditingController passwordController) {
    return CustomElevatedButton(
        isItDone: true,
        isThatSignIn: true,
        nameOfButton: 'Next',
        // blueColor: validate ? true : false,
        onPressed: () async {
          pushToPage(context,
              page: UserNamePage(
                emailController: emailController,
                fullNameController: fullNameController,
                passwordController: passwordController,
              ),
              withoutRoot: false,
              withoutPageTransition: true);
        });
  }
}
