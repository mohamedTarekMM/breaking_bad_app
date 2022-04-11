import 'package:breaking_bad_app/cubit/cubit.dart';
import 'package:breaking_bad_app/models/character_model.dart';
import 'package:breaking_bad_app/shared/constants/colors.dart';
import 'package:breaking_bad_app/shared/constants/strings.dart';
import 'package:flutter/material.dart';


class CharacterItems extends StatelessWidget {
  final CharacterModel character;

  const CharacterItems({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColors.lightColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          BreakingBadCubit.get(context).getQuotes(author: character.name!);
          Navigator.pushNamed(context, characterDetails,arguments: character);
        },
        child: GridTile(
          child: Hero(
            tag: character.charId!,
            child: Container(
              color: AppColors.greyColor,
              child: character.img!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/loading.gif',
                image: character.img!,
                fit: BoxFit.fill,
              )
                  : Image.asset('assets/images/connection.jpg'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: AppColors.lightColor,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}