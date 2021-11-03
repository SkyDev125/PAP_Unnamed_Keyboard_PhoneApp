import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/main_body.dart';
import 'components/bottom_nav_bar.dart';
import 'components/floating_action_button.dart';
import 'components/top_app_bar.dart';

class PasswordsPage extends StatelessWidget {
  const PasswordsPage({Key? key}) : super(key: key);
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Theme.of(context).bottomAppBarColor,
      ),
      child: const Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: TopAppBar(),
      body: MainBody(),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ),
    );
  }
}