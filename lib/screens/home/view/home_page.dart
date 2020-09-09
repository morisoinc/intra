
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
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          final user = Firestore.instance.collection('users').document(snapshot.data.uid).get();

          return FutureBuilder(
            future: user,
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> data = snapshot.data.data;
                return BlocProvider<HomeCubit>(
                  create: (context) => HomeCubit(data['firstName'] + ' ' + data['lastName']),
                  child: HomeContent(),
                );
              }

              return Text(
                'NO USER WAS FOUND',
                style: TextStyle(
                    fontSize: 48
                ),
              );
            },
          );
        }

        return Text(
          'NO USER WAS FOUND',
          style: TextStyle(
            fontSize: 48
          ),
        );
      },
    );
  }
}