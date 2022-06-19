import 'package:all_about_clubs/repositories/ClubsRepository.dart';
import 'package:all_about_clubs/utils/app_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/club.dart';
import '../utils/helpers.dart';

enum SortType { sortByName, sortByValue }

enum DownloadState { loading, success, error }

class HomeProvider with ChangeNotifier {
  ClubsRepository _clubsRepository;

  HomeProvider(this._clubsRepository);
  List<Club>? clubs;
  SortType sortType = SortType.sortByName;
  DownloadState downloadState = DownloadState.loading;

  getClubs() async {
    clubs = await _clubsRepository.getClubs();
    if (clubs == null) {
      //something went wrong while loading clubs
      downloadState = DownloadState.error;
      notifyListeners();
      return;
    }
    sortClubsByName();
    downloadState = DownloadState.success;
  }

  void sortClubsByName() {
    sortType = SortType.sortByName;
    clubs?.sort((a, b) => a.name!.compareTo(b.name!));
    notifyListeners();
  }

  void sortClubsByValue() {
    sortType = SortType.sortByValue;
    clubs?.sort((a, b) => a.value!.compareTo(b.value!));
    notifyListeners();
  }

  void toggleSortClubs(BuildContext context) {
    if (clubs == null || clubs!.isEmpty) {
      return;
    }

    switch (sortType) {
      case SortType.sortByName:
        showSnackBar(context, AppStrings.sorting_clubs_by_value);
        sortClubsByValue();
        break;
      case SortType.sortByValue:
        showSnackBar(context, AppStrings.sorting_clubs_by_name);
        sortClubsByName();
        break;
    }
  }
}
