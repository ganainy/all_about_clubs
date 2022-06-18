import '../models/club.dart';

//using the repository pattern we can easily later change how we fetch data without
//having to modify code in multiple places
abstract class ClubsRepositoryContract {
  Future<List<Club>?> getClubs();
}
