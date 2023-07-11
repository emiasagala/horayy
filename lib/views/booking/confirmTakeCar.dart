// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, await_only_futures, prefer_final_fields

import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_mobile/models/bookingModel.dart';
import 'package:rental_mobile/providers/bookingProvider.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rental_mobile/Models/CarModel.dart';
import 'package:rental_mobile/views/booking/payment.dart';
import 'package:uuid/uuid.dart';

class TakeCarScreen extends StatefulWidget {
  const TakeCarScreen({required this.item});

  final Item item;
  @override
  State<TakeCarScreen> createState() => _TakeCarScreenState();
}

class _TakeCarScreenState extends State<TakeCarScreen> {
  //UPLOAD Foto Diri
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;

  //UPLOAD Foto KTP
  FilePickerResult? result1;
  String? fileName1;
  PlatformFile? pickedFile1;
  bool isLoading1 = false;
  File? fileToDisplay1;

  //FORM
  String? dateStartInput;
  // ignore: unused_field
  TextEditingController _name = TextEditingController();

  void PickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        // allowedExtensions: ['png', 'jpeg'],
      );

      if (result != null) {
        fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());

        print('FileName $fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void PickFileKTP() async {
    try {
      setState(() {
        isLoading1 = true;
      });

      result1 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        // allowedExtensions: ['png', 'jpeg', 'jpg'],
      );

      if (result1 != null) {
        fileName1 = result1!.files.first.name;
        pickedFile1 = result1!.files.first;
        fileToDisplay1 = File(pickedFile1!.path.toString());

        print('FileName $fileName1');
      }

      setState(() {
        isLoading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<BookingProvider>(context);
    final uuid = Uuid();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rental Mobil Horayyy'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 70),
                child: const Text(
                  "Konfirmasi Pengambilan Mobil",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ),
              ),
              //Textfield
              // ignore: avoid_unnecessary_containers
              Container(
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 6),
                        child: const Text("Jenis Mobil : ")),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 55.0, left: 12),
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: '${widget.item.merk}'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 6),
                        child: const Text("Biaya Sewa : ")),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 55.0, left: 12),
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: '${widget.item.price}'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 6),
                        child: const Text("Nama : ")),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 55.0, left: 40),
                        child: TextFormField(
                          controller: _name,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      child: const Text("Foto Diri : "),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      child: pickedFile != null
                          ? Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 35),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      hintText: fileName),
                                ),
                              ),
                            )
                          : Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 35),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      hintText: ''),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 30.0, left: 12),
                      child: isLoading
                          ? CircularProgressIndicator()
                          : TextButton(
                              onPressed: () {
                                PickFile();
                              },
                              child: Text('Pick File'),
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      child: const Text("Foto KTP : "),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      child: pickedFile1 != null
                          ? Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 35),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      hintText: fileName1),
                                ),
                              ),
                            )
                          : Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 35),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 30.0),
                      child: isLoading
                          ? CircularProgressIndicator()
                          : TextButton(
                              onPressed: () {
                                PickFileKTP();
                              },
                              child: Text('Pick File'),
                            ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      child: const Text("Tanggal Pengambilan : "),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: DateTimePicker(
                        type: DateTimePickerType.date,
                        initialValue: '',
                        dateHintText: 'dd/mm/yyyy',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        onChanged: (val) => {
                          dateStartInput = DateFormat('dd MMM yyyy')
                              .format(DateTime.parse(val))
                        },
                        validator: (val) {
                          dateStartInput = DateFormat('dd MMM yyyy')
                              .format(DateTime.parse(val!));
                          return null;
                        },
                        onSaved: (val) => {
                          dateStartInput = DateFormat('dd MMM yyyy')
                              .format(DateTime.parse(val!))
                        },
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 50.0),
                        child: const Icon(Icons.calendar_month))
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 60, right: 15),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      prov.addCar(
                        Booking(
                          id: uuid.v1(),
                          item: Item(
                              id: uuid.v1(),
                              img: widget.item.img,
                              merk: widget.item.merk,
                              price: widget.item.price),
                          nama: _name.text,
                          fotodiri: fileName.toString(),
                          fotoktp: fileName1.toString(),
                          tanggal: dateStartInput.toString(),
                        ),
                      );

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PayementScreen()));
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const PayementScreen(),
                      //   ),
                      // );
                    },
                    child: const Text('Next'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
