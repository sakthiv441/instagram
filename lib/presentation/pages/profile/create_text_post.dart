// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:instagram/core/functions/date_of_now.dart';
// import 'package:instagram/core/resources/color_manager.dart';
// import 'package:instagram/core/resources/strings_manager.dart';
// import 'package:instagram/core/resources/styles_manager.dart';
// import 'package:instagram/core/utility/constant.dart';
// import 'package:instagram/core/utility/injector.dart';
// import 'package:instagram/data/models/child_classes/post/post.dart';
// import 'package:instagram/data/models/parent_classes/without_sub_classes/user_personal_info.dart';
// import 'package:instagram/presentation/cubit/firestoreUserInfoCubit/user_info_cubit.dart';
// import 'package:instagram/presentation/cubit/postInfoCubit/post_cubit.dart';
// import 'package:instagram/presentation/pages/register/widgets/popup_calling.dart';
// import 'package:instagram/presentation/widgets/global/custom_widgets/custom_circulars_progress.dart';

// import '../../../data/data_sources/remote/post/firestore_post.dart';

// class CreateTextPostPage extends StatefulWidget {
//   const CreateTextPostPage({Key? key}) : super(key: key);

//   @override
//   State<CreateTextPostPage> createState() => _CreateTextPostPageState();
// }

// class _CreateTextPostPageState extends State<CreateTextPostPage> {
//   final isItDone = ValueNotifier(true);

//   TextEditingController captionController = TextEditingController(text: "");
//   late UserPersonalInfo myPersonalInfo;

//   late File firstImage;
//   @override
//   void initState() {
//     myPersonalInfo = UserInfoCubit.getMyPersonalInfo(context);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<PostCubit>(
//       create: (context) => injector<PostCubit>(),
//       child: Scaffold(
//           backgroundColor: Theme.of(context).primaryColor,
//           appBar: isThatMobile ? appBar(context) : null,
//           body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Padding(
//               padding: const EdgeInsetsDirectional.only(
//                   start: 10.0, end: 10, top: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 70,
//                     width: 70,
//                     child: TextFormField(
//                       autofocus: true,
//                       controller: captionController,
//                       cursorColor: ColorManager.teal,
//                       style: getNormalStyle(
//                           color: Theme.of(context).focusColor, fontSize: 15),
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: StringsManager.writeACaption.tr,
//                         hintStyle: TextStyle(
//                             color: Theme.of(context).bottomAppBarColor),
//                       ),
//                     ),
//                   ),
//                   const Divider(),
//                   buildText(StringsManager.tagPeople.tr),
//                   const Divider(),
//                   buildText(StringsManager.addLocation.tr),
//                   const Divider(),
//                   buildText(StringsManager.alsoPostTo.tr),
//                 ],
//               ),
//             )
//           ])),
//     );
//   }

//   Padding buildText(String text) {
//     return Padding(
//       padding: const EdgeInsetsDirectional.only(
//           start: 7, end: 7, bottom: 10, top: 10),
//       child: Text(
//         text,
//         style:
//             getNormalStyle(fontSize: 16.5, color: Theme.of(context).focusColor),
//       ),
//     );
//   }

//   AppBar appBar(BuildContext context) {
//     return AppBar(
//         elevation: 0,
//         iconTheme: IconThemeData(color: Theme.of(context).focusColor),
//         backgroundColor: Theme.of(context).primaryColor,
//         title: Text(
//           StringsManager.newPost.tr,
//           style: getNormalStyle(color: Theme.of(context).focusColor),
//         ),
//         actions: actionsWidgets(context));
//   }

//   List<Widget> actionsWidgets(BuildContext context) {
//     return [
//       ValueListenableBuilder(
//         valueListenable: isItDone,
//         builder: (context, bool isItDoneValue, child) => !isItDoneValue
//             ? const CustomCircularProgress(ColorManager.blue)
//             : IconButton(
//                 onPressed: () async => FireStorePost.createPost(Post(
//                   aspectRatio: 0.75,
//                   publisherId: myPersonalId,
//                   datePublished: DateReformat.dateOfNow(),
//                   caption: captionController.text,
//                   blurHash: 'null',
//                   isItText: true,
//                   imagesUrls: [],
//                   comments: [],
//                   likes: [],
//                 )),
//                 icon: const Icon(
//                   Icons.check_rounded,
//                   size: 30,
//                   color: ColorManager.blue,
//                 ),
//               ),
//       ),
//     ];
//   }

//   Future<void> createPost(BuildContext context) async {
//     WidgetsBinding.instance
//         .addPostFrameCallback((_) => setState(() => isItDone.value = false));
//     Post postInfo;

//     postInfo = addPostInfo();

//     if (!mounted) return;

//     PostCubit postCubit = BlocProvider.of<PostCubit>(context, listen: false);
//     await postCubit.createTextPost(postInfo);

//     if (postCubit.newPostInfo != null) {
//       if (!mounted) return;

//       await UserInfoCubit.get(context).updateUserPostsInfo(
//           userId: myPersonalId, postInfo: postCubit.newPostInfo!);
//       await postCubit.getPostsInfo(
//           postsIds: myPersonalInfo.posts, isThatMyPosts: true);
//       WidgetsBinding.instance
//           .addPostFrameCallback((_) => setState(() => isItDone.value = true));
//     }
//     if (!mounted) return;

//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(
//           builder: (context) => PopupCalling(myPersonalId),
//         ),
//         (route) => false);
//   }

//   Post addPostInfo() {
//     return Post(
//       aspectRatio: 0.75,
//       publisherId: myPersonalId,
//       datePublished: DateReformat.dateOfNow(),
//       caption: captionController.text,
//       blurHash: 'null',
//       imagesUrls: [],
//       comments: [],
//       likes: [],
//     );
//   }
// }
