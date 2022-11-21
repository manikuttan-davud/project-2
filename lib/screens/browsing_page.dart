import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_two/models/recomended_songs_model.dart';
import 'package:project_two/utilts/text_styles.dart';

class BrowsingPage extends StatelessWidget {
   final RecommendeSongsModel songs;
    const BrowsingPage (this.songs, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: const Color.fromRGBO(40, 0, 71, 1),
      body:SafeArea(
        child: Column(
          children: [
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Padding(
                     padding:  EdgeInsets.only(top: 40.h,left: 24.w),
                     child: InkWell(
                      onTap: (() => Navigator.pop(context)),
                       child: Stack(
                        children:[
                          
                           SvgPicture.asset('assets/svg/Ellipse 1 (1).svg'),
                        Padding(
                          padding: const EdgeInsets.all(13),
                          child: SvgPicture.asset('assets/svg/Vector (1).svg'),
                        ) 
                       ]),
                     ),
                   ),
                   
                   Padding(
                     padding:  EdgeInsets.only(top: 40.h,right: 24.w),
                     child: Stack(children:[ SvgPicture.asset('assets/svg/Ellipse 1 (2).svg'),
                     Padding(
                       padding:  EdgeInsets.only(top: 16.h,left: 10.w),
                       child: Row(
                        children: [
                          SvgPicture.asset('assets/svg/Ellipse 14.svg'),
                          SizedBox(width: 2.w,),
                           SvgPicture.asset('assets/svg/Ellipse 14.svg'),
                          
                        ],
                       ),
                     )
                     ]
                     ),
                   )
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 132.h,left: 24.w,right: 24.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: NetworkImage(songs.url,),
                  fit: BoxFit.cover
                  )
                  ),
                  width: 327.w,
                  height: 274.h,
                ),
              ),
              SizedBox(height: 34.h,),
              Text(
                songs.name,style: tsS16C0xW600 ,
              ),
              SizedBox(height: 5.h,),
              Text(songs.artist,style:tsS13C0xW500  ,)
          ] 
            )
        ),
      );
  }
}
