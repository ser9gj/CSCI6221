import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

// collection reference
final CollectionReference udata=Firestore.instance.collection('user_info');

Future updateUserData(String fname, String lname, String major,) async{
return await udata.document(uid).setData({

'first name': fname,
'last name': lname,
'major':major,

});

}

}