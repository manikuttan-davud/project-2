import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:project_two/models/songs_model.dart';
import 'package:project_two/utilts/format_time.dart';
import 'package:project_two/utilts/text_styles.dart';

class SamplePage extends StatefulWidget {
  final BrowseSongsModel songs;
  const SamplePage(this.songs, {super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  final audioPlayer=AudioPlayer();
  bool isPlaying=false;
  Duration duration =Duration.zero;
  Duration position=Duration.zero;
  @override
  void initState() {
    
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying=event==PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
       duration=newDuration; 
      });
    });

     audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
       duration=newPosition; 
      });
    });
  }
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
                  image: DecorationImage(image: NetworkImage(widget.songs.url,),
                  fit: BoxFit.cover
                  )
                  ),
                  width: 327.w,
                  height: 274.h,
                ),
              ),
              SizedBox(height: 34.h,),
              Text(
                widget.songs.name,style: tsS16C0xW600 ,
              ),
              SizedBox(height: 5.h,),
              Text(widget.songs.category,style:tsS13C0xW500 ,),
              SizedBox(height: 10.h,),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                 onChanged:((value) async{
                   
                 })),

                 SizedBox(height: 5.h,),

                 Row(
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration-position)),
                  ],
                 ),

                Stack(
                  children: [
                    SvgPicture.asset('assets/svg/Ellipse 25.svg'),
                      Padding(
                        padding: const EdgeInsets.all(27),
                        child: InkWell(
                          onTap: () async {
                            if(isPlaying){
                              await audioPlayer.pause();
                            }
                            else {
                             
                           await  audioPlayer.play(AssetSource('assets/music/allthat.mp3'));
                            }
                          },
                          child: SvgPicture.asset('assets/svg/Vector (2).svg')),
                      )
                  ],
                ),
          ] 
            )
        ),
      );
  }
}
