import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/app_routes/app_routes.dart';
import 'package:breaking_bad_app/cubit/cubit.dart';
import 'package:breaking_bad_app/cubit/states.dart';
import 'package:breaking_bad_app/shared/blocObserver/bloc_observer.dart';
import 'package:breaking_bad_app/shared/constants/strings.dart';
import 'package:breaking_bad_app/shared/constants/themes.dart';
import 'package:breaking_bad_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(() {
    runApp(MyApp(appRoutes:AppRoutes(),));
  },
  blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  const MyApp({Key? key,required this.appRoutes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>BreakingBadCubit()..getAllCharacters(),
      child: BlocConsumer<BreakingBadCubit,BreakingBadStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light_theme(),
            darkTheme:  dark_theme(),
            themeMode: ThemeMode.light,
            onGenerateRoute: appRoutes.generateRoutes,
            initialRoute: homeScreen,
          );
        },
      ),
    );
  }
}

