import 'package:flutter/material.dart';
import 'package:instagramclone/utils/global_variables.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileaScreenLayout;
  const ResponsiveLayout({Key? key,
    required this.mobileaScreenLayout,
    required this.webScreenLayout}) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {


  @override
  void initState() {
    addData();

    super.initState();
  }


  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder:(context, constraints) {
          if(constraints.maxWidth > webScreenSIze){
            return widget.webScreenLayout;
          }
          return widget.mobileaScreenLayout;
        });
  }
}
