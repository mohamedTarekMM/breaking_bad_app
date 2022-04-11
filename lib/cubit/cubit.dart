
import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/cubit/states.dart';
import 'package:breaking_bad_app/models/character_model.dart';
import 'package:breaking_bad_app/shared/network/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreakingBadCubit extends Cubit<BreakingBadStates> {
  BreakingBadCubit() : super(InitialBreakingBadStates());

  static BreakingBadCubit get(context) => BlocProvider.of(context);
  List<CharacterModel> characters=[];
  List<CharacterModel> searchList=[];

  getAllCharacters() {
    emit(GetAllCharactersLoadingStates());
    DioHelper.getData(path: 'characters')
        .then((value) {
          List<dynamic> response = value.data;
          for (var character in response) {
            characters.add(CharacterModel.fromJson(character));
          }
          //print(characters[2].name);
          emit(GetAllCharactersSuccessfullyStates());
    })
        .catchError((error) {
          print(error.toString());
      emit(GetAllCharactersErrorStates());
    });
  }
  // with Api Way To Search For Character
/*  searchCharacter({
    required String name
}){
    searchList = [];
    emit(GetSearchLoadingStates());
    DioHelper.getData(path: 'characters', query: {
      'name':name
    }).then((value) {
      List<dynamic> pro = value.data;
      for (var element in pro) {
        searchList.add(CharacterModel.fromJson(element));
      }
      emit(GetSearchSuccessfullyStates());
    }).catchError((error){
      print(error.toString());
      emit(GetSearchErrorStates());
    });
  }*/
  // with local Way To Search For Character
  getSearchList({required String name}){
    searchList = [];
    searchList=characters.where((element) => element.name!.toLowerCase().startsWith(name)).toList();
    emit(GetSearchSuccessfullyStates());
  }
List<Quotes> quotesList = [];
  getQuotes({required String author}){
    quotesList = [];
    DioHelper.getData(path: 'quote',query: {
      'author': author,
    }).then((value) {
      List<dynamic> pro = value.data;
      pro.forEach((element) {
        quotesList.add(Quotes.fromJson(element));
      });
      print(quotesList[0].quote);
      emit(GetQuotesSuccessfullyStates());
    }).catchError((error){
      print(error.toString());
      emit(GetQuotesErrorStates());
    });
  }

}
