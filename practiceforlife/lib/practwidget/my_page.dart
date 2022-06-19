// import 'package:flutter/material.dart';
//
// import 'frog_color.dart';
//
// class MyPage extends StatelessWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FrogColor(
//         color: Colors.yellowAccent,
//         child: Builder(
//           builder: (BuildContext innerContext) {
//             return Text(
//               'Hello Frog',
//               style: TextStyle(color: FrogColor.of(innerContext).color),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }