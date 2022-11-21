import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_two/screens/browsing_page.dart';
import 'package:project_two/screens/option_widget_2.dart.dart';
import 'package:project_two/screens/option_widget_3.dart.dart';
import 'package:project_two/screens/sample_card.dart';
import 'package:project_two/utilts/colors.dart';
import 'package:project_two/utilts/data.dart';
import 'package:project_two/utilts/data_two.dart';
import 'package:project_two/utilts/text_styles.dart';

class TryOutPage extends StatefulWidget {
  const TryOutPage({super.key});

  @override
  State<TryOutPage> createState() => _TryOutPageState();
}

class _TryOutPageState extends State<TryOutPage> {
  //TODO: This is a comment
  //TODO: This is another comment.
  List? recommended;
  @override
  void initState() {
    recommended = recommendedSongs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //TODO:LINEAR GRADIENT
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
                  itemBuilder: ((context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BrowsingPage()),
                        ),
                        child: SampleCard(
                          category: sampleCardSongs[index]['category'],
                          name: sampleCardSongs[index]['name']
                              .toString()
                              .toUpperCase(),
                          url: sampleCardSongs[index]['url'],
                        ),
                      ))),
            ),
            //list of music category
            const MusicCategories(),
            SizedBox(
              height: 43.h,
            ),
            //list of recommend music
            const OptionsWidget(),
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
            'Browse',
            style: tsS16C0xW700,
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BrowsingPage()),
          ),
        ));
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

class MusicCategories extends StatefulWidget {
  const MusicCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<MusicCategories> createState() => _MusicCategoriesState();
}

class _MusicCategoriesState extends State<MusicCategories> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
  TabController _tabController = TabController(length: 3, vsync:this);
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 1.sw,
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: const [
            Tab(text: 'Recommendation',),
            Tab(text: 'Recommendation',),
            Tab(text: 'Recommendation',)
          ]),
        ),
   TabBarView(
          controller: _tabController,
          children: const [
               Text('hi'),
               Text('there'),
               Text('Here')
        ])
      ],
    );
    // Row(
    //children: [
    //Padding(
    //padding: EdgeInsets.only(left: 23.w),
    //child: Text(
    //'Recommendation',
    //style: tsS16C0xW700,
    //),
    //),
    //SizedBox(
    //width: 35.w,
    //),
    //Text(
    //   'Popular',
    // style: tsS14C0xW500,
    //),
    //SizedBox(
    //width: 35.w,
    //),
    // Text(
    //'New Music',
    //  style: tsS14C0xW500,
    //  ),
    //  ],
    //  );
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
  final String url;
  final String name;
  final String category;

  const SampleCard({
    Key? key,
    required this.name,
    required this.category,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 132.w,
          height: 159.h,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(url)),
              borderRadius: BorderRadius.circular(15.r)),
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          name,
          style: tsS16C0xW700,
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          category,
          style: tsS12C0xW500,
        ),
      ]),
    );
  }
}
