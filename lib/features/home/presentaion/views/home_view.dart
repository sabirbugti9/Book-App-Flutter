import 'package:flutter/material.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
      drawer: Drawer(),
    );
  }
}
