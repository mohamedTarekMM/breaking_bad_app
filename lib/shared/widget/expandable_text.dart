import 'package:breaking_bad_app/shared/widget/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key,required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}
late String firstHalf;
late String secondHalf;
bool hiddenText = true;
double textHeight = 150;
class _ExpandableTextState extends State<ExpandableText> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(height:1.4,text: firstHalf,size: 15,):Column(
        children: [
          SmallText(text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf),size: 15,height: 1.4,),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: 'Show More',size: 20),
                hiddenText?const Icon(Icons.arrow_drop_down,color: Colors.blue,):const Icon(Icons.arrow_drop_up,color: Colors.blueGrey,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}