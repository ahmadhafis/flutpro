import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionOutPage extends StatefulWidget {
  const TransactionOutPage({super.key});

  @override
  State<TransactionOutPage> createState() => _TransactionOutPageState();
}

class _TransactionOutPageState extends State<TransactionOutPage> {
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Masukkan Pengeluaran"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(labelText: "Masukkan Tanggal"),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2099),
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);

                      dateController.text = formattedDate;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Nominal",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Keterangan",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: ElevatedButton(onPressed: () {}, child: Text("Save"))),
              SizedBox(
                height: 10,
              ),
              Center(
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Reset"))),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
