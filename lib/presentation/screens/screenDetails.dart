import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:templete_bloc_ex/data/model/Results.dart';

import '../../constrains/colors.dart';
import '../widgets/cracterInfo.dart';

class CharacterScreenDetails extends StatelessWidget {
  final Results character;
  CharacterScreenDetails({super.key, required this.character});
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(
          character.title ?? '',
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.id ?? '',
          child: CachedNetworkImage(
            imageUrl: character.imageUrl!,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            buildSliverAppBar(),
            SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        characterInfo('family : ', character.family!),
                        buildDivider(290),
                        characterInfo('firstName : ', character.firstName!),
                        buildDivider(265),
                        characterInfo('lastName : ', character.lastName!),
                        buildDivider(265),
                        characterInfo('fullName : ', character.fullName!),
                        buildDivider(265),
                        characterInfo('image : ', character.image!),
                        buildDivider(293),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 450,),

                ]))
          ],
        ),
      ),
    );
  }
}
