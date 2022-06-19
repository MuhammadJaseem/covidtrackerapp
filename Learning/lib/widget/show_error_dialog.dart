

  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

Future dialogBox(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              'Request Failed',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            content: Column(
              children: [
                CircleAvatar(
                    radius: size.width * 0.07,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.highlight_off_rounded,
                      color: Colors.white,
                    )),
                Text(
                  'All fields are required',
                  style: TextStyle(
                      fontSize: 15,
                      color: kFontLight,
                      fontWeight: FontWeight.w200),
                )
              ],
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: false,
                child: GestureDetector(
                  onTap: (){Navigator.pop(context);},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(90)),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: size.width*0.3,vertical: size.height*0.02),
                      child: Text(
                        'Ok',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

