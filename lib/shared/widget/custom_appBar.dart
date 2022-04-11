import 'package:breaking_bad_app/shared/widget/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool? isSearch;
  var searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSearch = false;
  }
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: isSearch == false,
      builder: (context) {
        return AppBar(
        centerTitle: false,
        title:  Text('Characters',style: Theme.of(context).textTheme.headline3,),
        backgroundColor: AppColors.yellowColor,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isSearch = true;
            });
          }, icon: const Icon(Icons.search)),
        ],
      );
      },
      fallback: (context) {
        return AppBar(
        leading: IconButton(onPressed: (){
          setState(() {
            isSearch = false;
          });
        },icon: const Icon(Icons.arrow_back)),
        title:  defaultTextFormWithHintText(controller: searchController, keyboardType: TextInputType.text,hintText: 'search here',onTap: (){}),
        backgroundColor: AppColors.yellowColor,
        actions: [
          IconButton(onPressed: (){
          }, icon: const Icon(Icons.close)),
        ],
      );
      },
    );
  }
}
