import 'package:flutter/material.dart';

class CustomCircularButton extends StatelessWidget {

    const CustomCircularButton({
    Key key,
  @required this.icon,
  this.bgColor = Colors.white,
  @required this.onpressed

  }) : super(key: key);

  final Widget icon;
final void Function() onpressed; 
final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onpressed,
    shape: new CircleBorder(),
    fillColor: bgColor,
    elevation: 4.0,
    padding: EdgeInsets.all(4),
    child: CircleAvatar(
      
        child :icon,
        backgroundColor: Colors.transparent,
       
    ),
    );
  }
}