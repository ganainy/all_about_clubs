import 'package:all_about_clubs/repositories/ClubsRepository.dart';
import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  ClubsRepository clubsRepository;

  HomeProvider(this.clubsRepository);

  getClubs() {
    clubsRepository.getClubs().then((value) => {
          if (value == null)
            {
              //something went wrong while loading clubs
            }
          else
            {
              //clubs loaded successfully
              value.forEach((element) {
                print(element.name);
              })
            }
        });
  }
}
