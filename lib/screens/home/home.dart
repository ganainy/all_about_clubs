import 'package:all_about_clubs/providers/home_provdier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false).getClubs();
    return Scaffold(body: Container());
  }
}
