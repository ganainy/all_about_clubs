import 'package:all_about_clubs/providers/home_provdier.dart';
import 'package:all_about_clubs/shared/club_list_item.dart';
import 'package:all_about_clubs/shared/shimmer_widget.dart';
import 'package:all_about_clubs/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider homeProvider;
  @override
  void initState() {
    //call load method when page opened
    homeProvider = Provider.of<HomeProvider>(context, listen: false)
      ..getClubs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbarWidget(context),
        body: Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            return homeProvider.downloadState == DownloadState.loading
                ? buildLoadingWidget()
                : homeProvider.downloadState == DownloadState.error
                    ? buildErrorWidget()
                    : buildClubsListviewWidget(homeProvider);
          },
        ));
  }

  ListView buildClubsListviewWidget(HomeProvider homeProvider) {
    return ListView.separated(
      itemCount: homeProvider.clubs!.length,
      itemBuilder: (context, index) {
        return ClubListItem(homeProvider.clubs![index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.grey,
          height: 2,
        );
      },
    );
  }

  AppBar buildAppbarWidget(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.appName),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                homeProvider.toggleSortClubs(context);
              },
              child: const Icon(
                Icons.sort,
                size: 26.0,
              ),
            ))
      ],
    );
  }

  //shimmer effect loading layout
  buildLoadingWidget() {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                const ShimmerWidget(
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Column(
                  children: const [
                    SizedBox(
                      height: 16.0,
                    ),
                    ShimmerWidget(
                      width: 200,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    ShimmerWidget(
                      width: 200,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    ShimmerWidget(
                      width: 200,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.grey,
          height: 2,
        );
      },
    );
  }

  buildErrorWidget() {
    return Center(
      child: Text(
        AppStrings.loading_clubs_error,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
