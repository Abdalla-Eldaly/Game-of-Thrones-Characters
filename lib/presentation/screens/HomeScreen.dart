import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:templete_bloc_ex/business_logic/character_cubit.dart';
import 'package:templete_bloc_ex/constrains/colors.dart';

import '../../data/model/Results.dart';
import '../widgets/characterItems.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Results> allCharacters;

  @override
  void initState() {
    allCharacters = [];
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getallCharacters();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).getallCharacters();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
      ),
      body: buildCharacterScreen(),
    );
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
        child: CircularProgressIndicator(color: MyColors.myYellow),
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
          character: allCharacters[index],
        );
      },
      itemCount: allCharacters.length,
    );
  }
}
