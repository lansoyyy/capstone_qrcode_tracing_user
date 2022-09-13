import 'package:flutter/material.dart';
import 'package:qrcode_tracing_user/widgets/text_widget.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

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
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Image.network(
                  'https://th.bing.com/th/id/OIP.n78cAPnZXy9wC_Ht2PfMMwHaEL?pid=ImgDet&rs=1',
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ListTile(
                trailing: const Icon(Icons.check_box),
                title: TextBold(
                    text: 'Chicken', fontSize: 18, color: Colors.black),
                subtitle: TextRegular(
                    text: 'Weight: 25kg', fontSize: 12, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ListTile(
                trailing: const Icon(Icons.check_box),
                title: TextBold(
                    text: 'Native Chicken', fontSize: 18, color: Colors.black),
                subtitle: TextRegular(
                    text: 'Breed', fontSize: 12, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ListTile(
                trailing: const Icon(Icons.location_on_rounded),
                title: TextBold(
                    text: 'Cagayan De Oro City',
                    fontSize: 18,
                    color: Colors.black),
                subtitle: TextRegular(
                    text: 'Origin', fontSize: 12, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ListTile(
                trailing: const Icon(Icons.location_on_rounded),
                title: TextBold(
                    text: 'Iligan City', fontSize: 18, color: Colors.black),
                subtitle: TextRegular(
                    text: 'Destination', fontSize: 12, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.person),
                  subtitle: TextRegular(
                      text: 'Posted by', fontSize: 12, color: Colors.grey),
                  title: TextRegular(
                      text: 'Lance Olana', fontSize: 16, color: Colors.black),
                  children: [
                    ListTile(
                      trailing: const Icon(Icons.phone),
                      title: TextBold(
                          text: '09090104355',
                          fontSize: 18,
                          color: Colors.black),
                      subtitle: TextRegular(
                          text: 'Contact Number',
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                    ListTile(
                      trailing: const Icon(Icons.location_on_rounded),
                      title: TextBold(
                          text: 'Impasugong Bukidnon',
                          fontSize: 18,
                          color: Colors.black),
                      subtitle: TextRegular(
                          text: 'Address', fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        )),
      ),
    );
  }
}
