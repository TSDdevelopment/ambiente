import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBKfJUdOtg9aalrZKQzNXlwNaPyMBx5zH0",
            authDomain: "ambiente-u57z4s.firebaseapp.com",
            projectId: "ambiente-u57z4s",
            storageBucket: "ambiente-u57z4s.appspot.com",
            messagingSenderId: "381985745005",
            appId: "1:381985745005:web:34ba1e8e5bdfb8dfcbf764"));
  } else {
    await Firebase.initializeApp();
  }
}
