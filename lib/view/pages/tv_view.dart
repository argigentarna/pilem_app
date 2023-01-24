import 'package:flutter/material.dart';
import 'package:pilem_app/model/tv_model.dart';
import 'package:pilem_app/res/enum/tv_status.dart';
import 'package:pilem_app/res/textstyle.dart';
import 'package:pilem_app/view/widgets/tv/tv_card.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../view_model/tv_view_model.dart';
import '../widgets/loading_more.dart';
import '../widgets/movie/status_movie.dart';
import '../widgets/welcome_speech.dart';
import 'detil_tv_view.dart';

class TvView extends StatefulWidget {
  const TvView({super.key});

  @override
  State<TvView> createState() => _TvViewState();
}

class _TvViewState extends State<TvView> {
  TvViewModel tvViewModel = TvViewModel();
  ScrollController controllerScroll = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tvViewModel.changeStatusSelected(TvStatus.tvOnAir);
    tvViewModel.fetchTv();

    controllerScroll.addListener(() async {
      if (controllerScroll.position.pixels ==
          controllerScroll.position.maxScrollExtent) {
        tvViewModel.fetchTv();
      }
    });
  }

  void changeStatusTv(TvStatus val) async {
    await tvViewModel.changeStatusSelected(val);
    tvViewModel.fetchTv();
    setState(() {});
  }

  void navToDetilTv(TvItem item) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetilTvView(
          item: item,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 30,
        ),
        const WelcomeSpeech(
          title: 'Watching TV on your mobile',
        ),
        buildStatus(),
        const SizedBox(
          height: 20,
        ),
        buildTvByStatus(),
      ],
    );
  }

  Widget buildStatus() {
    bool isSelected(TvStatus val) {
      return tvViewModel.tvStatusSelected == val;
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        child: Row(
          children: [
            StatusMovie(
              title: 'TV On Air',
              isSelected: isSelected(TvStatus.tvOnAir),
              onPress: () {
                changeStatusTv(TvStatus.tvOnAir);
              },
            ),
            StatusMovie(
              title: 'Popular',
              isSelected: isSelected(TvStatus.popular),
              onPress: () {
                changeStatusTv(TvStatus.popular);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTvByStatus() {
    return SingleChildScrollView(
      controller: controllerScroll,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(
          left: 18,
        ),
        child: ChangeNotifierProvider<TvViewModel>(
          create: (context) => tvViewModel,
          child: Consumer<TvViewModel>(
            builder: (context, value, child) {
              switch (value.tvList.status!) {
                case Status.loading:
                  return const CircularProgressIndicator();
                case Status.error:
                  return Text(value.tvList.message.toString());
                case Status.completed:
                  return Row(
                    children: value.tvList.data!.results!.map((tv) {
                      var i = value.tvList.data!.results!.indexOf(tv);

                      return Row(
                        children: [
                          TvCard(
                            tvItem: tv,
                            onPress: () {
                              navToDetilTv(tv);
                            },
                          ),
                          LoadingMore(isLoading: value.isLoadingMore(i))
                        ],
                      );
                    }).toList(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
