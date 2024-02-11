import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:templete_bloc_ex/business_logic/character_cubit.dart';
import 'package:templete_bloc_ex/constrains/colors.dart';

import '../../data/model/Results.dart';
import '../widgets/characterItems.dart';
import '../widgets/noInternet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Results> allCharacters;
  late List<Results> searchForCharacters;
  bool _isSearch = false;
  final _searchTextController = TextEditingController();

  Widget _buildSSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      style: const TextStyle(
        fontSize: 18,
        color: MyColors.myGrey,
      ),
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Find Character...',
          hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18)),
      onChanged: (searchForCharacter) {
        addSearchForItemToSearchList(searchForCharacter);
      },
    );
  }

  void addSearchForItemToSearchList(String searchForCharacter) {
    searchForCharacters = allCharacters
        .where((character) =>
        character.fullName!.toLowerCase().startsWith(searchForCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildappbarActions() {
    if (_isSearch) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: MyColors.myGrey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: Icon(
              Icons.search,
              color: MyColors.myGrey,
            ))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearch = true;
    });
  }

  void _stopSearch() {
    _clearSearch();
    setState(() {
      _isSearch = false;
    });
  }

  void _clearSearch() {
    _searchTextController.clear();
  }

  @override
  void initState() {
    allCharacters = [];
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getallCharacters();
  }

  Widget _buildNormalAppBar() {
    return Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey, fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).getallCharacters();
    return Scaffold(
        appBar: AppBar(
          leading: _isSearch
              ? BackButton(
            color: MyColors.myGrey,
          )
              : Container(),
          backgroundColor: MyColors.myYellow,
          title: _isSearch ? _buildSSearchField() : _buildNormalAppBar(),
          actions: _buildappbarActions(),
        ),
        body: OfflineBuilder(
          connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
              ) {
            final bool connected = connectivity != ConnectivityResult.none;

            if (connected) {
              return buildCharacterScreen();
            } else {
              return buildNoInternetWidget();
            }
          },
          child: buildLoading(),
        ));
  }

  Widget buildCharacterScreen() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildLoaded();
        } else {
          return buildLoading();
        }
      },
    );
  }

  Widget buildLoading() {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: Center(
        child: Image.asset('assets/images/loading.gif'),
      ),
    );
  }

  Widget buildLoaded() {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: SingleChildScrollView(
        child: buildCharacterList(),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        childAspectRatio: 3 / 5,
        crossAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: _searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchForCharacters[index],
        );
      },
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchForCharacters.length,
    );
  }
}
