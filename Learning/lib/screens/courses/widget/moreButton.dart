import 'package:flutter/material.dart';

import '../../constant.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.03),
      decoration: BoxDecoration(
          color: kAccent,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Text('More',style: TextStyle(fontSize: size.width*0.03,color: Colors.white),),
    );
  }
}