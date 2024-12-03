import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAsVswRF_OOCNZg2ANvU_s1YWKPohdObm8",
            authDomain: "calorias-diarias-i42yke.firebaseapp.com",
            projectId: "calorias-diarias-i42yke",
            storageBucket: "calorias-diarias-i42yke.firebasestorage.app",
            messagingSenderId: "29940990689",
            appId: "1:29940990689:web:0fdd1f846e31edf56c2da0"));
  } else {
    await Firebase.initializeApp();
  }
}
