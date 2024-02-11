import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:templete_bloc_ex/business_logic/character_cubit.dart';
import 'package:templete_bloc_ex/data/model/Results.dart';
import 'package:templete_bloc_ex/data/repository/repository.dart';
import 'package:templete_bloc_ex/data/web_service/web_Services.dart';
import 'package:templete_bloc_ex/presentation/screens/HomeScreen.dart';
import 'package:templete_bloc_ex/presentation/screens/screenDetails.dart';

import 'constrains/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharacterCubit characterCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    characterCubit = CharacterCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen1:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => characterCubit,
            child: HomeScreen(),
          ),
        );
      case CharacterScreenDetails1:
        final character = settings.arguments as Results;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharacterCubit(charactersRepository),
            child: CharacterScreenDetails(character: character,),
          ),
        );
    }
  }
}
