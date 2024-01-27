import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:templete_bloc_ex/data/model/Results.dart';

import '../data/repository/repository.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;
  CharacterCubit(this.charactersRepository) : super(CharacterInitial());
   List<Results> characters=[];

  List<Results> getallCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
