import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad_app/cubit/cubit.dart';
import 'package:breaking_bad_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/character_model.dart';
import '../shared/constants/colors.dart';

class CharacterDetailsScreen extends StatelessWidget {
  CharacterModel character;

  CharacterDetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreakingBadCubit, BreakingBadStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BreakingBadCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.greyColor,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              customSliverAppBar(context),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Birthday: ', character.birthday!),
                      defaultDivider(350),
                      characterInfo('Status: ', character.status!),
                      defaultDivider(300),
                      characterInfo('Jobs: ', character.jobs!.join(' / ')),
                      defaultDivider(250),
                      characterInfo('portrayed: ', character.portrayed!),
                      defaultDivider(200),
                      if (character.appearance!.isNotEmpty)
                        characterInfo(
                            'Seasons: ', character.appearance!.join('/')),
                      if (character.appearance!.isNotEmpty) defaultDivider(150),
                      if (character.betterCallSaulAppearance!.isNotEmpty)
                        characterInfo('Better Call Saul Appearance: ',
                            character.betterCallSaulAppearance!.join(' / ')),
                      if (character.betterCallSaulAppearance!.isNotEmpty)
                        defaultDivider(100),
                    ],
                  ),
                ),
                quoteItem(context),
                    const SizedBox(height: 400,),
              ]))
            ],
          ),
        );
      },
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: AppColors.lightColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: AppColors.lightColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget defaultDivider(double endIndeed) => Divider(
        color: AppColors.yellowColor,
        thickness: 1,
        height: 30,
        endIndent: endIndeed,
      );

  Widget customSliverAppBar(context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.greyColor,
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,
        title: Text(
          character.nickname!,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: AppColors.lightColor),
        ),
        background: Hero(
          tag: character.charId!,
          child: Image.network(
            character.img!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget quoteItem(context) {
    List<Quotes> quoteList = BreakingBadCubit.get(context).quotesList;
    if (quoteList.isNotEmpty) {
      int randomIndex =
          Random().nextInt(BreakingBadCubit.get(context).quotesList.length - 1);
      return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
        child:  SizedBox(
        width: 250.0,
        child: TextLiquidFill(
          text: quoteList[randomIndex].quote!,
          waveColor: Colors.white,
          boxBackgroundColor: Colors.blueGrey,
           textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      );
    } else {
      return Container();
    }
  }
}
