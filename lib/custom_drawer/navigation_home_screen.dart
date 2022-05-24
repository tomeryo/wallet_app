import 'package:wallet_app/custom_drawer/app_theme.dart';
import 'package:wallet_app/custom_drawer/drawer_user_controller.dart';
import 'package:wallet_app/custom_drawer/home_drawer.dart';
import 'package:wallet_app/home/home_screen.dart';
import 'package:wallet_app/offers/search/search.dart';
import 'package:wallet_app/payment/cards.dart';
import 'package:wallet_app/map/map.dart';
import 'package:flutter/material.dart';



class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const FitnessAppHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const FitnessAppHomeScreen();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = const MapSample();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = const Search();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = const ExistingCardsPage();
          });
          break;
        default:
          break;
      }
    }
  }
}
