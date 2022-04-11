import 'package:breaking_bad_app/modules/character_detailes.dart';
import 'package:breaking_bad_app/modules/home_screen.dart';
import 'package:breaking_bad_app/shared/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/character_model.dart';

class AppRoutes {
  Route? generateRoutes(RouteSettings settings) {
    switch(settings.name){
      case homeScreen:
        return MaterialPageRoute(builder: (_)=>HomeScreen());
      case characterDetails:
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(builder: (_)=>CharacterDetailsScreen(character: character,));
    }
    return null;
  }
}
