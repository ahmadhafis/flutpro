import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TextEditingController dateController = TextEditingController();
  bool isExpense = true;
  List<String> list = ['Pemasukan', 'Pengeluaran'];
  late String dropDownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Masukkan Cash Flow"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Switch(
                    value: isExpense,
                    onChanged: (bool value) {
                      setState(() {
                        isExpense = value;
                      });
                    },
                    inactiveTrackColor: Colors.green[200],
                    inactiveThumbColor: Colors.green,
                    activeColor: Colors.red,
                  ),
                  Text(
                    isExpense ? 'Pengeluaran' : 'Pemasukan',
                    style: GoogleFonts.montserrat(fontSize: 18),
                  ),
                ],
              ),
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
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Jenis",
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<String>(
                    value: dropDownValue,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_downward),
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {}),
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
  }
}
