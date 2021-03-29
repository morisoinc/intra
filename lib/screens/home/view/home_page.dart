import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intra/screens/home/cubit/home_cubit.dart';
import 'package:intra/screens/home/view/home_content.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();

    print('COMING UP');

    return FutureBuilder(
      future: user,
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        print('DOES IT HAVE DATA');
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data.data();
          return BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(data['fullName']),
            child: HomeContent(),
          );
        }

        return Text(
          '',
          style: TextStyle(fontSize: 48),
        );
      },
    );
  }
}
