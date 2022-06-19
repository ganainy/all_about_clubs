import 'package:all_about_clubs/models/club.dart';
import 'package:all_about_clubs/screens/club/club.dart';
import 'package:all_about_clubs/utils/app_strings.dart';
import 'package:flutter/material.dart';

import 'my_cached_network_image.dart';

class ClubListItem extends StatelessWidget {
  ClubListItem(this.club, {Key? key}) : super(key: key);

  Club club;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClubScreen(club)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Hero(tag: club.image!, child: MyCachedNetworkImage(club.image!)),
            SizedBox(
              width: screenWidth -
                  100 /*width of image*/ -
                  2 * 8 /*padding of start & end*/,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FittedBox(
                      child: Text(
                        club.name!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(club.country!,
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${club.value}' ' ${AppStrings.millionen}',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
