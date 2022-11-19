import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: ColorConfig.greyColor2,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(CupertinoIcons.bell, color: Colors.black54,),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(backgroundColor: Colors.red[400],radius: 4.5,))
          ],
        ),
      ),
    );
  }
}
