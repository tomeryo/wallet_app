
import 'package:wallet_app/home/inside_screen.dart';
import 'package:flutter/material.dart';
import 'home_app_theme.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  const FitnessAppHomeScreen({Key? key}) : super(key: key);

  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;



  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {



    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = TrainingScreen(animationController: animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(child: Text('Home')),
        ),
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return Stack(
                children: <Widget>[
                  TrainingScreen(animationController: animationController),
                  // bottomBar(),
                ],
              );
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

}
