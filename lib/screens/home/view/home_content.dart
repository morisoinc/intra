

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/home/cubit/home_cubit.dart';
import 'package:intra/widgets/IntraContainer.dart';
import 'package:intra/widgets/IntraPageTitleText.dart';

class HomeContent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return IntraContainer(
            IntraPageTitleText('Olá, ' + state.userName)
        );
      }
    );
  }
}