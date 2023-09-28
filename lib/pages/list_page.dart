import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            elevation: 12,
            child: ListTile(
              title: Text("Rp. 6.000.000"),
              subtitle: Text("Gaji"),
              leading: Container(
                child: Icon(
                  Icons.download,
                  color: Colors.green,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            elevation: 12,
            child: ListTile(
              title: Text("Rp. 40.000"),
              subtitle: Text("Makan Siang"),
              leading: Container(
                child: Icon(
                  Icons.upload,
                  color: Colors.red,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
