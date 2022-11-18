import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_two/screens/browsing_page.dart';
import 'package:project_two/screens/option_widget_2.dart.dart';
import 'package:project_two/screens/option_widget_3.dart.dart';
import 'package:project_two/screens/sample_card.dart';
import 'package:project_two/utilts/data.dart';
import 'package:project_two/utilts/data_two.dart';
import 'package:project_two/models/practice.dart';
import 'package:project_two/utilts/text_styles.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  List? recommended;
  @override
  void initState() {
    recommended = recommendedSongs;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: const Color.fromRGBO(40, 0, 71, 1),
        body: SafeArea(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // search boxl̥l̥l̥
            const SearchAvatar(),
            // it contains browse text
            const BrowseText(),
            SizedBox(
                height: 250.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sampleCardSongs.length,
                    itemBuilder: ((context, index) {
                      Songs songs = normalSongs[index];
                      return SampleCard(songs:songs ,
                      
                      );
                    }))),
            DefaultTabController(
                length: 3,
                child: Container(
                  color: Colors.red,
                  width: 1.sw,
                  height: 500,
                  child: Column(
                    children: [
                      TabBar(
                          isScrollable: true,
                          tabs: const [
                       
                               
                                 Tab(
                                  text: 'Recommendation',
                                ),
                            Tab(
                              text: "Popular",
                            ),
                            Tab(
                              text: 'New Music',
                            )
                          ],
                          indicator:  UnderlineTabIndicator(
                            insets:EdgeInsets.only(right: 100.w) ,
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          )),
                      const Expanded(
                        child: TabBarView(children: [
                          OptionsWidget(),
                          OptionsWidget2(),
                          OptionsWidget3()
                        ]),
                      )
                    ],
                  ),
                ))
            //list of music category
            // const MusicCategories(),
            // SizedBox(
            //   height: 43.h,
            // ),
            // const OptionsWidget2()
          ]),
        )));
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
      child: InkWell(
        child: Text(
          'BROWSE',
          style: tsS16C0xW700,
        ),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BrowsingPage())),
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
        SvgPicture.asset(("assets/svg/Ellipse 1.svg")),
        Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(("assets/svg/Vector.svg")),
        ),
      ]),
    );
  }
}

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 300.h,
      child: ListView.separated(
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 24.h),
              child: MusicTile(
                url: recommendedSongs[index]['url'],
                name: recommendedSongs[index]['name'].toString().toUpperCase(),
                artist: recommendedSongs[index]['artist'],
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image:
                DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
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
 final Songs songs;
  const SampleCard({
    Key? key, required this.songs,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
            child: Container(
              width: 132.w,
              height: 159.h,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(songs.url)),
                  borderRadius: BorderRadius.circular(15.r)),
            ),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SamplePage(songs)),
                )),
        SizedBox(
          height: 24.h,
        ),
        Text(
          songs.name,
          style: tsS16C0xW700,
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
        songs.category,
          style: tsS12C0xW500,
        ),
      ]),
    );
  }
}
