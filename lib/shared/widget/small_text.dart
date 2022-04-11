import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  double? size;
  double height;
  TextStyle? textStyle;
  SmallText({Key? key,required this.text,this.size,this.height = 1.2,this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:Theme.of(context).textTheme.bodyText1!.copyWith(height: height)
    );
  }
}
