import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/home/cubit/home_cubit.dart';
import 'package:intra/screens/schedule_session/view/schedule_session_page.dart';
import 'package:intra/theme.dart';
import 'package:intra/widgets/base_screen_widget/IntraContainer.dart';
import 'package:intra/widgets/base_screen_widget/IntraHeader.dart';
import 'package:intra/widgets/button/intra_big_main_button.dart';
import 'package:intra/widgets/button/intra_split_pill_button.dart';
import 'package:intra/widgets/text/intra_page_subtitle_text.dart';
import 'package:intra/widgets/text/intra_subpage_title_text.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return IntraContainer(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              IntraBigMainButton(
                'Agendar Consulta',
                'Veja o perfil dos psicólogos e escolha seu horário',
                () => _openScheduleSession(context),
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: IntraBigMainButton(
                      'Minhas Tarefas',
                      'Anote e estude',
                      null,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: IntraBigMainButton(
                      'Notas Mentais',
                      'Anote como se sente',
                      null,
                    ),
                  ),
                ],
              ),
            ],
          ),
          headerContent: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            IntraSubpageTitleText(
              'Olá, ' + state.userName + '!',
              color: white1,
            ),
            SizedBox(height: 8),
            IntraPageSubtitleText(
              'Como está se sentindo hoje?',
              color: white1,
            ),
            SizedBox(height: 16),
            IntraSplitPillButton(
              'Consultas',
              '2 agendadas',
              'Tarefas',
              '5 anotadas',
            ),
          ]),
          bgStyle: backgroundStyle.curved,
        );
      },
    );
  }

  _openScheduleSession(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ScheduleSessionPage()));
  }
}
