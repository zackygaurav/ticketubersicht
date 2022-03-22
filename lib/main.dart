import 'dart:convert';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketubersicht_task/list_data_model.dart';
import 'package:ticketubersicht_task/screens/main_fragment.dart';
import 'package:ticketubersicht_task/style/style.dart';
import 'package:ticketubersicht_task/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticketubersicht',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppTheme.primarySwatch(AppStyle.primaryColor),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CircularBottomNavigationController _navigationController =
      CircularBottomNavigationController(2);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios,
          ),
          actions: const [
            Icon(Icons.info_outline),
            SizedBox(
              width: 16.0,
            ),
            Icon(Icons.notifications_none_sharp),
            SizedBox(
              width: 16.0,
            )
          ],
          flexibleSpace: Center(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: const TabBar(
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  letterSpacing: 1.5,
                ),
                isScrollable: true,
                indicatorColor: Colors.green,
                indicatorWeight: 3.0,
                tabs: [
                  Tab(
                    text: 'TICKETÜBERSICHT',
                    iconMargin: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            MainFragment(),
          ],
        ),
        bottomNavigationBar: CircularBottomNavigation(
          <TabItem>[
            TabItem(Icons.label_important_outline_rounded, '', Colors.green),
            TabItem(Icons.stacked_bar_chart, '', Colors.green),
            TabItem(Icons.home_rounded, '', Colors.green),
            TabItem(Icons.camera_alt_outlined, '', Colors.green),
            TabItem(Icons.image, '', Colors.green),
          ],
          circleSize: 64.0,
          controller: _navigationController,
          selectedCallback: (int? position) {
            // TODO Not Impemented Yet
          },
        ),
      ),
    );
  }
}
