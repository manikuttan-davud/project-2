
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_two/utilts/data_3.dart';
import 'package:project_two/utilts/text_styles.dart';

class OptionsWidget2 extends StatelessWidget {
  const OptionsWidget2({
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
                url: popularSongs[index]['url'],
                name: popularSongs[index]['name'].toString().toUpperCase(),
                artist: popularSongs[index]['artist'],
              ),
            );
          }),
          separatorBuilder: ((context, index) {
            return Divider(
              height: 5.h,
            );
          }),
          itemCount:popularSongs.length),
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