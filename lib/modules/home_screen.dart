import 'package:breaking_bad_app/cubit/cubit.dart';
import 'package:breaking_bad_app/cubit/states.dart';
import 'package:breaking_bad_app/shared/constants/colors.dart';
import 'package:breaking_bad_app/shared/constants/strings.dart';
import 'package:breaking_bad_app/shared/widget/characterItem.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../shared/widget/components.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: AppColors.greyColor,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 18),
      ),
      style: const TextStyle(color: AppColors.greyColor, fontSize: 18),
      onChanged: (searchController) {
        BreakingBadCubit.get(context).getSearchList(name: searchController);
      },
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear, color: AppColors.greyColor),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: AppColors.greyColor,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      BreakingBadCubit.get(context).searchList.clear();
      _searchTextController.clear();
    });
  }

  Widget _buildAppBarTitle() {
    return  Text(
      'Characters',
      style: Theme.of(context).textTheme.headline3,
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreakingBadCubit, BreakingBadStates>(
      listener: (context, state) {
        if(state is GetSearchLoadingStates){
             const Center(child: CircularProgressIndicator(color: AppColors.yellowColor));
        }
      },
      builder: (context, state) {
        var cubit = BreakingBadCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.greyColor,
          appBar: AppBar(
            backgroundColor: AppColors.yellowColor,
            leading: _isSearching
                ? const BackButton(
              color: AppColors.greyColor,
            )
                : Container(),
            title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
            actions: _buildAppBarActions(),
          ),
          body: OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
            ){
              final bool connected = connectivity != ConnectivityResult.none;
              if(connected){
                return ConditionalBuilder(
                  condition: state is! GetAllCharactersLoadingStates || _isSearching == true,
                  builder: (context) => gridItems(context),
                  fallback: (context) {
                    if(_isSearching == true){
                      return gridItems(context);
                    }else{
                      return const Center(child: CircularProgressIndicator(color: AppColors.yellowColor,));
                    }
                  },
                );
              }else{
                return _offlineFun();
              }
            },
            child: const Center(child: CircularProgressIndicator(color: AppColors.yellowColor,)),
          ),
        );
      },
    );
  }
Widget _offlineFun()=> Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset('assets/images/noInternet.png',fit: BoxFit.cover,),
      const SizedBox(height: 20,),
      Text(noInternet,style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),),
    ],
  ),
);
  Widget gridItems(context) {
    if(_isSearching == false) {
      return GridView.builder(
          itemCount: BreakingBadCubit
              .get(context)
              .characters
              .length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 2 / 2.5,
          ),
          itemBuilder: (context, index) =>
              CharacterItems(character: BreakingBadCubit
                  .get(context)
                  .characters[index]));
    }else{
      return GridView.builder(
          itemCount: BreakingBadCubit
              .get(context)
              .searchList
              .length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 2 / 2.5,
          ),
          itemBuilder: (context, index) =>
              CharacterItems(character: BreakingBadCubit
                  .get(context)
                  .searchList[index]));
    }
  }

}
