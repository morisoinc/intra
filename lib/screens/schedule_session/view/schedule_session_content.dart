import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/schedule_session/cubit/schedule_session_cubit.dart';
import 'package:intra/screens/therapists/therapists.dart';
import 'package:intra/widgets/base_screen_widget/IntraContainer.dart';
import 'package:intra/widgets/base_screen_widget/IntraHeader.dart';
import 'package:intra/widgets/button/intra_back_button.dart';
import 'package:intra/widgets/button/intra_big_main_button.dart';
import 'package:intra/widgets/text/intra_page_subtitle_text.dart';
import 'package:intra/widgets/text/intra_page_title_text.dart';

class ScheduleSessionContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleSessionCubit, ScheduleSessionState>(
        listener: (context, state) {},
        builder: (context, state) {
          return IntraContainer(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6),
                IntraBigMainButton(
                  'Psicólogos',
                  'Veja especialistas disponíveis',
                  () => _openTherapists(context),
                ),
                SizedBox(height: 35),
                IntraBigMainButton(
                    'Calendário', 'Dê prioridade ao dia da consulta', null),
              ],
            ),
            headerContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntraPageTitleText('Agendar Consulta'),
                SizedBox(height: 14),
                IntraPageSubtitleText(
                    'Veja os profissionais disponíveis e escolha o que melhor pode te ajudar'),
              ],
            ),
            onBackPressed: () => Navigator.pop(context),
            bgStyle: backgroundStyle.translucentRectangles,
          );
        });
  }

  _openTherapists(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TherapistsPage()));
  }
}
