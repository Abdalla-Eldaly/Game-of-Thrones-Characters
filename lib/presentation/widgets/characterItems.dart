import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:templete_bloc_ex/constrains/colors.dart';
import 'package:templete_bloc_ex/data/model/Results.dart';

import '../../constrains/strings.dart';

class CharacterItem extends StatelessWidget {
  final Results character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, CharacterScreenDetails1,arguments: character);
        },
        child: Hero(
          tag: character.id??'',
          child: GridTile(
            footer: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black.withOpacity(.6),
              alignment: Alignment.bottomCenter,
              child: Text(
                '${character.fullName}',
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            child: Container(
              child: character.image!.isNotEmpty
                  ? CachedNetworkImage(
                imageUrl: character.imageUrl!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: Image.asset('assets/images/loading.gif'),
                ),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error),),
              )
                  :                 Center(child: Icon(Icons.error),),

            ),
          ),
        ),
      ),


    );

  }
}
