


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/therapists/cubit/therapists_cubit.dart';
import 'package:intra/screens/therapists/therapists.dart';

class TherapistsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TherapistsCubit>(
      create: (context) => TherapistsCubit(),
      child: TherapistsContent(),
    );
  }
}