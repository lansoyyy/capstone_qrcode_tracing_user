import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_tracing_user/widgets/text_widget.dart';
import 'package:get_storage/get_storage.dart';

class ResultPage extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title:
            TextRegular(text: 'Scan Result', fontSize: 18, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Livestock')
                    .where('id', isEqualTo: box.read('result'))
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        color: Colors.green,
                      )),
                    );
                  }

                  final data = snapshot.requireData;
                  return ListView.builder(
                      itemCount: snapshot.data?.size ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Image.network(
                                  data.docs[index]['livestockPicture'],
                                  height: 200,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 10, 50, 10),
                              child: ListTile(
                                trailing: const Icon(Icons.check_box),
                                title: TextBold(
                                    text: data.docs[index]['type'],
                                    fontSize: 18,
                                    color: Colors.black),
                                subtitle: TextRegular(
                                    text:
                                        'Weight: ${data.docs[index]['weight']}kg',
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 10, 50, 10),
                              child: ListTile(
                                trailing: const Icon(Icons.check_box),
                                title: TextBold(
                                    text: data.docs[index]['breed'],
                                    fontSize: 18,
                                    color: Colors.black),
                                subtitle: TextRegular(
                                    text: 'Breed',
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 10, 50, 10),
                              child: ListTile(
                                trailing: const Icon(Icons.location_on_rounded),
                                title: TextBold(
                                    text: data.docs[index]['origin'],
                                    fontSize: 18,
                                    color: Colors.black),
                                subtitle: TextRegular(
                                    text: 'Origin',
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 10, 50, 10),
                              child: ListTile(
                                trailing: const Icon(Icons.location_on_rounded),
                                title: TextBold(
                                    text: data.docs[index]['destination'],
                                    fontSize: 18,
                                    color: Colors.black),
                                subtitle: TextRegular(
                                    text: 'Destination',
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 10, 50, 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ExpansionTile(
                                  leading: const Icon(Icons.person),
                                  subtitle: TextRegular(
                                      text: 'Posted by',
                                      fontSize: 12,
                                      color: Colors.grey),
                                  title: TextRegular(
                                      text: data.docs[index]['name'],
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: [
                                    ListTile(
                                      trailing: const Icon(Icons.phone),
                                      title: TextBold(
                                          text: data.docs[index]
                                              ['contactNumber'],
                                          fontSize: 18,
                                          color: Colors.black),
                                      subtitle: TextRegular(
                                          text: 'Contact Number',
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                    ListTile(
                                      trailing:
                                          const Icon(Icons.location_on_rounded),
                                      title: TextBold(
                                          text: data.docs[index]['address'],
                                          fontSize: 18,
                                          color: Colors.black),
                                      subtitle: TextRegular(
                                          text: 'Address',
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        );
                      });
                })),
      ),
    );
  }
}
