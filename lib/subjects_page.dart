import 'package:attendance_system/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({Key? key}) : super(key: key);

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: customText(txt: 'Classes', clr: Colors.black, fsize: 22.0),
        backgroundColor: Colors.transparent,
        // bottom: PreferredSize(

        //   preferredSize: const Size.fromHeight(50.0),
        //   child: customText(txt: 'Classes'),
        // ),
        centerTitle: true,
leading: IconButton(
  onPressed: () {},
  icon:  const Icon(
    Icons.arrow_back,
    // size: 25.0,
    color: Colors.black,
  ),
),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // crossAxisSpacing: 0.0,
            // mainAxisSpacing: 0.0,
          ),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color.fromARGB(255, 60, 59, 59),
                  // image: const DecorationImage(
                  //   fit: BoxFit.fill,
                  //     image: NetworkImage(
                  //         'https://images.pexels.com/photos/2569997/pexels-photo-2569997.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))
                  ),
              margin: const EdgeInsets.all(3.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                        txt: 'Cloud\nComputing',
                        fsize: 22.0,
                        clr: Colors.white,
                        fweight: FontWeight.w500),
                    customText(
                        txt: 'CSE 4th Year',
                        fsize: 20.0,
                        clr: Colors.white,
                        fweight: FontWeight.w400),
                    customText(
                        txt: 'Student: 11',
                        fsize: 19.0,
                        clr: Colors.white,
                        fweight: FontWeight.w300)
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 18, 197, 179),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 25.0,
        ),
      ),
    );
  }
}
