import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_two/models/songs_model.dart';
import 'package:project_two/screens/sample_card.dart';
import 'package:project_two/utilts/text_styles.dart';

class MusicTile2 extends StatelessWidget {
  final String name;
  final String artist;
  final String url;

  const MusicTile2({
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
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            )),
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

class MusicTile3 extends StatelessWidget {
  final String name;
  final String artist;
  final String url;

  const MusicTile3({
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
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            )),
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

class OptionsWidget extends StatelessWidget {
  final List<dynamic> songList;
  const OptionsWidget({
    Key? key,
    required this.songList,
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
              child: MusicTile1(
                url: songList[index]['url'],
                name: songList[index]['name'].toString().toUpperCase(),
                artist: songList[index]['artist'],
              ),
            );
          }),
          separatorBuilder: ((context, index) {
            return Divider(
              height: 5.h,
            );
          }),
          itemCount: songList.length),
    );
  }
}

class MusicTile1 extends StatelessWidget {
  final String name;
  final String artist;
  final String url;

  const MusicTile1({
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
  final BrowseSongsModel songs;
  const SampleCard({
    Key? key,
    required this.songs,
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
