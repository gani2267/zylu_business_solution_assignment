import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zylu_business_solution_assignment/theme/styles.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PanelController _panelController = new PanelController();
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    CollectionReference employees =
        FirebaseFirestore.instance.collection('employees');
    var defaultHeight = 60.0;
    return Material(
      child: SlidingUpPanel(
        controller: _panelController,
        color: const Color(0xff1c1c1e),
        defaultPanelState: PanelState.CLOSED,
        backdropEnabled: true,
        minHeight: 0,
        maxHeight: min(defaultHeight + menu.length * 48,
            MediaQuery.of(context).size.height * 0.9),
        borderRadius: BorderRadius.circular(18),
        panel: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 6),
                width: 38,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              children: List.generate(
                  menu.length,
                  (index) => InkWell(
                        onTap: () {
                          _panelController.close().whenComplete(() {
                            setState(() {
                              _selected = index;
                            });
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 16, bottom: 28),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                child: Icon(
                                  Icons.check,
                                  color: _selected == index
                                      ? Colors.white.withOpacity(0.87)
                                      : Colors.transparent,
                                ),
                              ),
                              Expanded(
                                child: Text(menu[index],
                                    style: subtitle1.copyWith(
                                      color: _selected == index
                                          ? almostWhite
                                          : white38,
                                    ),
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ],
        ),
        body: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(108),
              child: Column(
                children: [
                  AppBar(
                    centerTitle: true,
                    elevation: 0,
                    backgroundColor: Colors.black,
                    title: Text("Employees"),
                  ),
                  InkWell(
                      onTap: () {
                        _panelController.open();
                      },
                      child: Hero(
                          tag: "explore1",
                          child: Material(
                              color: Colors.transparent,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 2),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 11),
                                //height: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xff1c1c1e),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        menu[_selected],
                                        style: subtitle2White,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Icon(
                                      Icons.expand_more,
                                      color: almostWhite,
                                    )
                                  ],
                                ),
                              ))))
                ],
              ),
            ),
            body: StreamBuilder(
              stream: employees.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final DocumentSnapshot _documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return employeeListItem(
                        documentSnapshot: _documentSnapshot,
                        selected: _selected,
                      );
                    },
                    itemCount: streamSnapshot.data!.size,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
      ),
    );
  }
}

class employeeListItem extends StatelessWidget {
  const employeeListItem(
      {Key? key, required this.documentSnapshot, required this.selected})
      : super(key: key);

  final DocumentSnapshot documentSnapshot;
  final int selected;

  @override
  Widget build(BuildContext context) {
    if (selected == 0) {
      return item();
    } else if (selected == 1 && documentSnapshot['exp_yrs'] > 5) {
      return item();
    } else if (selected == 2 && documentSnapshot['exp_yrs'] <= 5) {
      return item();
    } else if (selected == 3 && documentSnapshot['is_active']) {
      return item();
    } else if (selected == 4 && !documentSnapshot['is_active']) {
      return item();
    } else if(selected == 5 && documentSnapshot['exp_yrs'] > 5 && documentSnapshot['is_active'] ){
      return item();
    }

    return Container();
  }

  Widget item() {
    final bool ishelightable =
        (documentSnapshot['exp_yrs'] > 5 && documentSnapshot['is_active']);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    documentSnapshot['name'],
                    style: (ishelightable)
                        ? subtitle1White.copyWith(color: Colors.green)
                        : subtitle1White,
                  ),
                  Row(
                    children: [
                      Text(
                        'Experience : ',
                        style: captionWhite60,
                      ),
                      Text(
                        '${documentSnapshot['exp_yrs']} years',
                        style: (ishelightable)
                            ? captionWhite.copyWith(color: Colors.green)
                            : captionWhite,
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    documentSnapshot['state'],
                    style: (ishelightable)
                        ? subtitle1White.copyWith(color: Colors.green)
                        : subtitle1White,
                  ),
                  (documentSnapshot['is_active'])
                      ? Text(
                          'Active',
                          style: captionWhite60,
                        )
                      : Text('Not Active', style: captionWhite60)
                ],
              ),
            ],
          )),
    );
  }
}
