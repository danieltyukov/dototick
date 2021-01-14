// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:dototick/constants/constant.dart';
// import 'package:dototick/screens/home.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// Widget bottomnav(
//     BuildContext context, dynamic pageController, dynamic currentindex) {
//   return CurvedNavigationBar(
//     index: currentindex,
//     backgroundColor: MyConstants.darkgrey,
//     height: 55,
//     color: MyConstants.verydarkgrey,
//     onTap: (value) {
//       currentindex = value;
//       pageController.jumpToPage(value);
//     },
//     items: <Widget>[
//       IconButton(
//         icon: Icon(
//           Icons.add,
//           size: 30,
//           color: Colors.white,
//         ),
//         onPressed: (value) {
//           currentindex = value;
//           pageController.jumpToPage(value);
//         },
//       ),
//       IconButton(
//           icon: Icon(
//             Icons.list,
//             size: 30,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             pageController.animateToPage(
//               2,
//               Duration(milliseconds: 250),
//             );
//           }),
//     ],
//   );
// }
