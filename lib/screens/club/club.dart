import 'package:all_about_clubs/models/club.dart';
import 'package:all_about_clubs/shared/my_cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/app_strings.dart';

class ClubScreen extends StatelessWidget {
  ClubScreen(this.club, {Key? key}) : super(key: key);

  Club club;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(club.name!),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.grey[800],
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Hero(
                            tag: club.image!,
                            child: MyCachedNetworkImage(club.image!))),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            club.country!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(text: '${AppStrings.the_club} '),
                      TextSpan(
                          text: club.name!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ' ${AppStrings.from} ${club.country!} ${AppStrings.has_value_of} ${club.value} ${AppStrings.million_euro}')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' ${club.name} ${AppStrings.could_till_now} ${club.europeanTitles} ${AppStrings.european_wins_reach}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ));
  }
}
