import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutpro/pages/home_page.dart';
import 'package:flutpro/pages/list_page.dart';
import 'package:flutpro/pages/profile_page.dart';
import 'package:flutpro/pages/transaction_out_page.dart';
import 'package:flutpro/pages/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), ListPage(), ProfilePage()];
  int currentIndex = 0;

  void onTapTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0)
          ? CalendarAppBar(
              accent: Colors.amber,
              backButton: false,
              locale: 'id',
              onDateChanged: (value) => print(value),
              firstDate: DateTime.now().subtract(Duration(days: 140)),
              lastDate: DateTime.now(),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "List Data",
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => TransactionPage(),
            ))
                .then(
              (value) {
                setState(() {});
              },
            );
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
        ),
      ),
      body: _children[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                onTapTapped(0);
              },
              icon: Icon(Icons.home)),
          SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () {
                onTapTapped(1);
              },
              icon: Icon(Icons.list)),
          SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => TransactionOutPage(),
                ))
                    .then((value) {
                  setState(() {});
                });
              },
              icon: Icon(Icons.money_off)),
          SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () {
                onTapTapped(2);
              },
              icon: Icon(Icons.account_box)),
        ],
      )),
    );
  }
}
