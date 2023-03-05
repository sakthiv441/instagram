import 'package:flutter/material.dart';

import 'package:instagram/config/routes/app_routes.dart';

import '../../../widgets/global/custom_widgets/custom_elevated_button.dart';

class Facebook extends StatefulWidget {
  final VoidCallback? onpressedfunc;

  const Facebook({
    super.key,
    required this.onpressedfunc,
  });

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Find Your Facebook Friends',
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
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    'You choose which friends to follow. we will never post in facebook without your permission',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 160),
                SizedBox(
                    height: 180,
                    width: 180,
                    child: Image.asset('assets/splash/fb.png')),
                const Expanded(flex: 3, child: SizedBox(height: 20)),
                Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                ),
                CustomElevatedButton(
                    isItDone: true,
                    isThatSignIn: true,
                    nameOfButton: 'Connect with Facebook',
                    blueColor: true,
                    onPressed: () async {}),
                TextButton(
                    onPressed: () {
                      pushToPage(context,
                          page: ContactsPage(
                            onpressedfunc: widget.onpressedfunc,
                          ));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ));
  }
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key, required this.onpressedfunc});
  final VoidCallback? onpressedfunc;

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Find Contacts',
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
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    'See which of your friends are already on instagram and choose who to follow',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 160),
                SizedBox(
                    height: 180,
                    width: 180,
                    child: Image.asset('assets/splash/contact.png')),
                const Expanded(flex: 3, child: SizedBox(height: 20)),
                const Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    'Your contacts are periodically synced and stored securely on our servers. To remove contacts go to settings and disconnect',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                ),
                CustomElevatedButton(
                    isItDone: true,
                    isThatSignIn: true,
                    nameOfButton: 'Search Your Contacts',
                    blueColor: true,
                    onPressed: () async {}),
                TextButton(
                    onPressed: () {
                      pushToPage(context,
                          page: ProfilePicPage(
                            onpressedfunc: widget.onpressedfunc,
                          ));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ));
  }
}

class ProfilePicPage extends StatefulWidget {
  const ProfilePicPage({super.key, required this.onpressedfunc});
  final VoidCallback? onpressedfunc;

  @override
  State<ProfilePicPage> createState() => _ProfilePicPageState();
}

class _ProfilePicPageState extends State<ProfilePicPage> {
  bool reBuild = false;
  ValueNotifier<bool> isImageUpload = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Add Your Profile Photo',
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
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    'See which of your friends are already on instagram and choose who to follow',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 160),
                SizedBox(
                    height: 180,
                    width: 180,
                    child: Image.asset('assets/splash/profile.png')),
                const Expanded(flex: 3, child: SizedBox(height: 20)),
                Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                ),
                CustomElevatedButton(
                  isItDone: true,
                  isThatSignIn: true,
                  nameOfButton: 'Add A Photo',
                  blueColor: true,
                  onPressed: () async {},
                ),
                TextButton(
                    onPressed: () {
                      pushToPage(context,
                          page: DiscoverPeople(
                            onpressedfunc: widget.onpressedfunc,
                          ));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ));
  }
}

class DiscoverPeople extends StatefulWidget {
  const DiscoverPeople({super.key, required this.onpressedfunc});
  final VoidCallback? onpressedfunc;

  @override
  State<DiscoverPeople> createState() => _DiscoverPeopleState();
}

class _DiscoverPeopleState extends State<DiscoverPeople> {
  bool reBuild = false;
  ValueNotifier<bool> isImageUpload = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: widget.onpressedfunc,
                  icon: const Text(
                    'Next',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.blue),
                  )),
            ),
          ],
          elevation: 1,
          automaticallyImplyLeading: false,
          title: const Text(
            'Discover People',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: TextButton(
                    child: Text('data'),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
