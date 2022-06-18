import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/club.dart';
import '../network/dio_helper.dart';
import '../utils/app_strings.dart';
import 'ClubsRepositoryContract.dart';

class ClubsRepository extends ClubsRepositoryContract {
  List<Club> clubsList = [];

  @override
  Future<List<Club>?> getClubs() async {
    try {
      clubsList.clear();
      String endPoint = AppStrings.clubsEndpoint;
      await DioHelper.dio.get(endPoint).then((value) => {
            value.data.forEach((itemJson) {
              clubsList.add(Club.fromJson(itemJson));
            })
          });

      return clubsList;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint(e.response?.data);
        debugPrint(e.response?.headers.toString());
        debugPrint(e.response?.requestOptions.toString());
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
      }
      return null;
    }
  }
}
