import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/schedule_session/cubit/schedule_session_cubit.dart';
import 'package:intra/widgets/base_screen_widget/IntraContainer.dart';
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
          return IntraContainer(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntraBackButton(() {
                Navigator.pop(context);
              }),
              SizedBox(height: 42),
              IntraPageTitleText('Agendar Consulta'),

              SizedBox(height: 14),
              IntraPageSubtitleText('Veja os profissionais disponíveis e escolha o que melhor pode te ajudar'),

              SizedBox(height: 31),
              IntraBigMainButton('Psicólogos', 'Veja especialistas disponíveis', null),

              SizedBox(height: 35),
              IntraBigMainButton('Calendário', 'Dê prioridade ao dia da consulta', null),
            ],
          ));
        });
  }
}
