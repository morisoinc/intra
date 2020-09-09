

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/home/cubit/home_cubit.dart';

class HomeContent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Padding(
          child: Text(
              state.userName
          ),
          padding: EdgeInsets.only(
            left: 8.0,
            top: 32.0,
            right: 8.0,
            bottom: 32.0,
          ),
        );
      }
    );
  }
}