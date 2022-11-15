import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_two/models/recomended_songs_model.dart';
import 'package:project_two/utilts/colors.dart';
import 'package:project_two/utilts/data.dart';
import 'package:project_two/utilts/text_styles.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  List<dynamic>? recommended;

  @override
  void initState() {
    recommended = recommendedSongs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(recommended.toString());
    return Scaffold(
        //TODO:LINEAR GRADIENT
        backgroundColor: const Color.fromRGBO(40, 0, 71, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // search box
              const SearchAvatar(),
              // it contains browse text
              const BrowseText(),
              SizedBox(
                height: 250.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) => const SampleCard())),
              ),
              //list of music category
              const MusicCategories(),
              SizedBox(
                height: 43.h,
              ),
              //list of recommend music
              Options(
                data: recommended,
              ),
            ]),
          ),
        ));
  }
}

class BrowseText extends StatelessWidget {
  const BrowseText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 34.w, bottom: 21.h),
      child: Text(
        'Browse',
        style: tsS16C0xW700,
      ),
    );
  }
}

class SearchAvatar extends StatelessWidget {
  const SearchAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 311.w, top: 50.h),
      child: Stack(children: [
        CircleAvatar(
            radius: 20.r,
            backgroundColor: const Color.fromRGBO(225, 225, 225, 0.2)),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.search,
            color: colorFFFFFF,
          ),
        )
      ]),
    );
  }
}

class MusicCategories extends StatelessWidget {
  const MusicCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 23.w),
          child: Text(
            'Recommendation',
            style: tsS16C0xW700,
          ),
        ),
        SizedBox(
          width: 35.w,
        ),
        Text(
          'Popular',
          style: tsS14C0xW500,
        ),
        SizedBox(
          width: 35.w,
        ),
        Text(
          'New Music',
          style: tsS14C0xW500,
        ),
      ],
    );
  }
}

class Options extends StatelessWidget {
  final List? data;
  const Options({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 300.h,
      child: ListView.separated(
          itemBuilder: ((context, index) {
            RecommendeSongsModel? songItem =
                RecommendeSongsModel.fromJson(data?[index]);

            log(songItem.artist);
            return Padding(
              padding: EdgeInsets.only(left: 24.h),
              child: MusicTile(
                url: songItem.url,
                name: songItem.name.toString().toUpperCase(),
                artist: songItem.artist,
              ),
            );
          }),
          separatorBuilder: ((context, index) {
            return Divider(
              height: 5.h,
            );
          }),
          itemCount: recommendedSongs.length),
    );
  }
}

class MusicTile extends StatelessWidget {
  final String name;
  final String artist;
  final String url;

  const MusicTile({
    required this.name,
    required this.artist,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60.w,
        height: 60.h,
        decoration:
            BoxDecoration(image: DecorationImage(image: NetworkImage(url))),
      ),
      title: Text(
        name,
        style: tsS16C0xW600,
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 3.h),
        child: Text(
          artist,
          style: tsS13C0xW500,
        ),
      ),
      trailing: SizedBox(
        width: 30.w,
        height: 30.h,
        child: Row(
          children: [
            SvgPicture.asset("assets/svg/Ellipse 2.svg"),
            SizedBox(
              width: 5.w,
            ),
            SvgPicture.asset("assets/svg/Ellipse 2.svg")
          ],
        ),
      ),
    );
  }
}

class SampleCard extends StatelessWidget {
  const SampleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //images of the music
        const MusicImage(),

        SizedBox(
          height: 24.h,
        ),
        Text(
          'Clear Mind',
          style: tsS16C0xW700,
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          'Instrumental',
          style: tsS12C0xW500,
        ),
      ]),
    );
  }
}

class MusicImage extends StatelessWidget {
  const MusicImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132.w,
      height: 159.h,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(
                  'https://a10.gaanacdn.com/gn_img/albums/XYybzNrb2g/Yybzg5jmK2/size_l.jpg'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15.r)),
    );
  }
}
