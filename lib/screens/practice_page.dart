import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_two/screens/browsing_page.dart';
import 'package:project_two/utilts/data.dart';
import 'package:project_two/models/songs_model.dart';
import 'package:project_two/utilts/text_styles.dart';
import 'package:project_two/widgets/home/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //TODO: Move to colors.dart
        backgroundColor: const Color.fromRGBO(40, 0, 71, 1),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchAvatar(),
              // it contains browse text
              BrowseText(),
              BrowseSongs(),
              TabController()
            ],
          ),
        )));
  }
}

class TabController extends StatelessWidget {
  const TabController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: SizedBox(
          // color: Color(0x50A34BD5),
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
                  indicator: UnderlineTabIndicator(
                    insets: EdgeInsets.only(right: 100.w),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  )),
              Expanded(
                child: TabBarView(
                  children: [
                  OptionsWidget(songList: recommendedSongs),
                  OptionsWidget(songList: popularSongs),
                  OptionsWidget(songList: newSongs),
                ]),
              )
            ],
          ),
        ));
  }
}

class BrowseSongs extends StatelessWidget {
  const BrowseSongs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sampleCardSongs.length,
            itemBuilder: ((context, index) {
              BrowseSongsModel songs =
                  BrowseSongsModel.fromJson(browseSongs[index]);
              return SampleCard(
                songs: songs,
              );
            })));
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
      //  onTap: () => Navigator.push(context,
      //      MaterialPageRoute(builder: (context) => const BrowsingPage())),
      ),
    );
  }
}
