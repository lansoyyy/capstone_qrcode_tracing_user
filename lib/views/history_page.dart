import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qrcode_tracing_user/widgets/drawer_widget.dart';
import 'package:qrcode_tracing_user/widgets/text_widget.dart';

class HistoryPage extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: TextBold(text: 'History', fontSize: 22, color: Colors.white),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('History')
              .where('username', isEqualTo: box.read('username'))
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print('error');
              return const Center(child: Text('Error'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('waiting');
              return const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              );
            }

            final data = snapshot.requireData;
            return ListView.builder(
                itemCount: snapshot.data?.size ?? 0,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ExpansionTile(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextBold(
                            text: 'Origin: ${data.docs[index]['origin']}',
                            fontSize: 12,
                            color: Colors.black),
                        const SizedBox(
                          height: 10,
                        ),
                        TextBold(
                            text: 'Stop Off: ${data.docs[index]['stop']}',
                            fontSize: 12,
                            color: Colors.black),
                        const SizedBox(
                          height: 10,
                        ),
                        TextBold(
                            text:
                                'Destination: ${data.docs[index]['destination']}',
                            fontSize: 12,
                            color: Colors.black),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                      title: TextBold(
                          text: data.docs[index]['type'],
                          fontSize: 14,
                          color: Colors.black),
                      subtitle: TextBold(
                          text: data.docs[index]['breed'],
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  );
                }));
          }),
    );
  }
}
