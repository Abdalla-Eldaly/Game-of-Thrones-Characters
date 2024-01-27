import 'package:templete_bloc_ex/data/model/Results.dart';
import 'package:templete_bloc_ex/data/web_service/web_Services.dart';



class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Results>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Results.fromJson(character)).toList();
  }





}