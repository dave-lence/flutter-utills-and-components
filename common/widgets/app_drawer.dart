// import 'package:along_mobile/common/widgets/light_btn.dart';
// import 'package:along_mobile/features/personalization/screens/my_account_screen.dart';
// import 'package:along_mobile/utils/constant/color_connstant.dart';
// import 'package:along_mobile/utils/helpers/helper_fnc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../features/authentication/models/rider_model.dart';
// import '../../utils/constant/image_strings.dart';
// import '../../utils/constant/size.dart';

// class AppDrawer extends StatefulWidget {
//   const AppDrawer({super.key});

//   @override
//   State<AppDrawer> createState() => _AppDrawerState();
// }

// class _AppDrawerState extends State<AppDrawer> {
//   double value = 3.5;

//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();
//     final storedData = box.read('riderData');
//     final rider = storedData != null ? RiderModel.fromJson(storedData) : null;

//     return Drawer(
//       elevation: 5,
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(topRight: Radius.circular(1))),
//       backgroundColor: Colors.white,
//       child: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 GestureDetector(
//                   onTap: () => Get.to(const MyAccountScreen()),
//                   child: Container(
//                     margin: const EdgeInsets.only(top: CSize.xl),
//                     height: 100,
//                     child: Container(
//                       margin: EdgeInsets.zero,
//                       padding: const EdgeInsets.only(
//                         left: 30,
//                       ),
//                       decoration: const BoxDecoration(
//                         color: CColors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           const CircleAvatar(
//                             radius: 35,
//                             backgroundImage: AssetImage(
//                               CImage.profilePic,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: CSize.sm,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('${rider?.firstName} ${rider?.lastName}',
//                                   style: GoogleFonts.figtree(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600,
//                                       color: CColors.black)),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   RatingBar.builder(
//                                     initialRating: 3.5,
//                                     minRating: 1,
//                                     direction: Axis.horizontal,
//                                     allowHalfRating: true,
//                                     itemCount: 5,
//                                     itemSize: 15,
//                                     unratedColor: CColors.gray,
//                                     ignoreGestures: true,
//                                     updateOnDrag: false,
//                                     maxRating: 5,
//                                     itemPadding:
//                                         const EdgeInsets.only(right: 1),
//                                     itemBuilder: (context, _) => const Icon(
//                                       Icons.star,
//                                       size: 15,
//                                       color: Colors.amber,
//                                     ),
//                                     onRatingUpdate: (rating) {
//                                       debugPrint(rating.toString());
//                                     },
//                                   ),
//                                   const SizedBox(
//                                     width: CSize.xs,
//                                   ),
//                                   Text('3.5',
//                                       style: GoogleFonts.figtree(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w600,
//                                           color: CColors.darkGray)),
//                                 ],
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             width: CHelperFunctions.screenWidth(context) * 0.17,
//                           ),
//                           const Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: CColors.darkGray,
//                             size: 15,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Divider(color: CColors.gray, thickness: 1),
//                 ListTile(
//                     onTap: () {},
//                     minLeadingWidth: 19,
//                     leading: Image.asset(
//                       CImage.historyIcon,
//                       width: 18,
//                       height: 18,
//                     ),
//                     title: Text('My rides',
//                         style: GoogleFonts.figtree(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: CColors.black))),
//                 ListTile(
//                     minLeadingWidth: 19,
//                     leading: Image.asset(
//                       CImage.walletIcon,
//                       width: 18,
//                       height: 18,
//                     ),
//                     title: Text('Payment',
//                         style: GoogleFonts.figtree(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: CColors.black))),
//                 ListTile(
//                     minLeadingWidth: 19,
//                     leading: Image.asset(
//                       CImage.scheduleIcon,
//                       width: 18,
//                       height: 18,
//                     ),
//                     title: Text('Scheduled ride',
//                         style: GoogleFonts.figtree(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: CColors.black))),
//                 ListTile(
//                     minLeadingWidth: 19,
//                     leading: Image.asset(
//                       CImage.supportIcon,
//                       width: 18,
//                       height: 18,
//                     ),
//                     title: Text('Support',
//                         style: GoogleFonts.figtree(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: CColors.black))),
//                 ListTile(
//                     minLeadingWidth: 19,
//                     leading: Image.asset(
//                       CImage.infoicon,
//                       width: 18,
//                       height: 18,
//                     ),
//                     title: Text('About',
//                         style: GoogleFonts.figtree(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: CColors.black))),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: LightBtn(onTap: () {}, btnLabel: 'Switch to Driver Mode'),
//           ),
//           SizedBox(height: CHelperFunctions.screenHeight(context) * 0.04),
//         ],
//       ),
//     );
//   }
// }
