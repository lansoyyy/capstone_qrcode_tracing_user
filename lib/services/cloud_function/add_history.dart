import 'package:cloud_firestore/cloud_firestore.dart';

Future addHistory(String username, String password, String type, String weight,
    String origin, String stop, String destination, String breed) async {
  final docUser = FirebaseFirestore.instance.collection('History').doc();

  final json = {
    'username': username,
    'password': password,
    'type': type,
    'weight': weight,
    'origin': origin,
    'stop': stop,
    'destination': destination,
    'breed': breed,
    'id': docUser.id,
    'dateTime': DateTime.now()
  };

  await docUser.set(json);
}
