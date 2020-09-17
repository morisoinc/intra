

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/schedule_session/cubit/schedule_session_cubit.dart';
import 'package:intra/screens/schedule_session/view/schedule_session_content.dart';

class ScheduleSessionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScheduleSessionCubit>(
      create: (context) => ScheduleSessionCubit(),
      child: ScheduleSessionContent(),
    );
  }
}