import 'package:attendance_system/custom_text.dart';
import 'package:attendance_system/subjects_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class attendancePage extends StatefulWidget {
  const attendancePage({Key? key}) : super(key: key);

  @override
  State<attendancePage> createState() => _attendancePageState();
}

class _attendancePageState extends State<attendancePage> {
  var date = intl.DateFormat('dd-MMM-yyyy').format(DateTime.now());

//   Future<void> _submitdata() async {

//     for(var num = 1; num < 10; num++){
//        await FirebaseFirestore.instance
//         .collection('CSIT')
//         .doc()
//         .set({
//           'roll_no': 'BCSF18BM0$num',
//           'name' : 'Student $num',
//         }, SetOptions(merge: true));
//     }
// print('loop completed');

//   }

  List studentdata = [];
  List studentAttendance = [];

  @override
  void initState() {
    super.initState();
    _getdata();
  }

  Future<void> _getdata() async {
    await FirebaseFirestore.instance
        .collection('CSIT')
        .orderBy('roll_no', descending: false)
        .get()
        .then((QuerySnapshot qs) {
      for (var doc in qs.docs) {
        studentdata.add(doc.data());
        studentAttendance.add({
          'roll_no': doc['roll_no'],
          'status' : 'p',
        });
      }
    });
    setState(() {
      
    });
  }

  var attendanceStatus = 'P';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BSCS 2018-2022'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: customText(
                  txt: 'Dated: $date',
                  fsize: 20.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              child: 
              studentdata.isEmpty ?
             const Center(child: CircularProgressIndicator(),):
              ListView.builder(
                itemCount: studentdata.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: customText(txt: '$index'),
                    title: customText(txt: '${studentdata[index]['name']}', fsize: 18.0),
                    subtitle: customText(txt: '${studentdata[index]['roll_no']}'),
                    trailing: DropdownButton<String>(
                      value: 'P',
                      items: <String>['P', 'A'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newval) {
                        setState(() {
                          attendanceStatus = newval.toString();
                        });
                      },
                    ),
                    dense: true,
                  );
                }),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(
                shape: const StadiumBorder(),
                onPressed: () {
                  Get.to(
                    () => SubjectsPage(),
                  );
                },
                child: customText(txt: 'Submit', clr: Colors.white),
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
