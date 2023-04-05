import 'package:flutter/material.dart';

class MomoScreen extends StatelessWidget {
  final Widget? body;
  final Key? keys;
  final Widget? drawer;
  final Text? title;
  final Widget? floatingAction;
  final void Function()? onPressed;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const MomoScreen(
      {Key? key,
      this.body,
      this.floatingAction,
      this.bottomNavigationBar,
      this.floatingActionButtonLocation,
      this.actions,
      this.title,
      this.drawer,
      this.onPressed,
      this.keys})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keys,
      appBar: AppBar(
        // backgroundColor: Colo,
        backgroundColor: Colors.amber[400],
        title: title,
        centerTitle: true,
        leading: Image.asset(
          './assets/images/images.png',
          width: 30,
          height: 30,
        ),
        actions: actions,
      ),
      drawerEdgeDragWidth: double.infinity - 50,
      drawer: drawer,
      body: body,
      floatingActionButton: floatingAction,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
