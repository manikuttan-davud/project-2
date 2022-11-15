
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_two/utilts/colors.dart';
import 'package:project_two/utilts/text_styles.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO:LINEAR GRADIENT
       backgroundColor: const Color.fromRGBO(40, 0, 71, 1),
       body: SafeArea(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // search box 
            const SearchAvatar(),
            // it contains browse text
            const BrowseText(),
          SizedBox(
            height: 250.h,
            child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: ((context, index) =>   const SampleCard())),
          ),
          //list of music category
            const MusicCategories(),
            SizedBox(height: 43.h,),
            //list of recommend music
            const RecommentedMusic()
           
          ]
       ),
    )
    );
  }
}

class BrowseText extends StatelessWidget {
  const BrowseText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 34.w,bottom: 21.h),
      child: Text('Browse',
      style: tsS16C0xW700 ,
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
      padding:  EdgeInsets.only(left: 311.w,top: 50.h),
      child: Stack(
        children:[ CircleAvatar(
          radius: 20.r,
                  backgroundColor: const Color.fromRGBO(225, 225, 225, 0.2)
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.search,
                  color: colorFFFFFF,
                  ),
                )
        ]
      ),
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
          padding:  EdgeInsets.only(left: 23.w),
          child: Text('Recommendation',
          style:tsS16C0xW700,
          ),
        ),
        SizedBox(width: 35.w,),
         Text('Popular',
        style: tsS14C0xW500,
        ),
        SizedBox(width: 35.w,),
         Text('New Music',
        style: tsS14C0xW500,
        ),

      ],
    );
  }
}

class RecommentedMusic extends StatelessWidget {
  const RecommentedMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      height: 300.h,
      child: ListView.separated(itemBuilder:((context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 24.h),
          child: ListTile(
            leading: Container(
              width: 60.w,
              height: 60.h,
              decoration: const BoxDecoration(
               image: DecorationImage(image: NetworkImage('https://c.saavncdn.com/804/Urban-Mood-English-2018-20180226044503-500x500.jpg'))
              ),
            ),
            title: Text("Born To Die",
            style: tsS16C0xW600 ,
            ),
            subtitle: Padding(
              padding:  EdgeInsets.only(top:3.h ),
              child: Text('Lena Del Rey',
              style:tsS13C0xW500 ,
              ),
            ),
            //TODO:svg issue
           // trailing: Icon(Icons),
          ),
        );
    
      }),
       separatorBuilder: ((context, index) {
         return Divider(height: 5.h,);
       }),
        itemCount: 10),
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
      padding:  EdgeInsets.only(left: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //images of the music
          const MusicImage(),
        
      
        
               SizedBox(height: 24.h,),
           Text('Clear Mind',
          style:tsS16C0xW700 ,
          ),
       SizedBox(height: 3.h,),
        Text('Instrumental',
      style:tsS12C0xW500 ,
      ),
        ]
      ),
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
         height:159.h,
        decoration:  BoxDecoration(
         image: const DecorationImage(image:NetworkImage('https://a10.gaanacdn.com/gn_img/albums/XYybzNrb2g/Yybzg5jmK2/size_l.jpg'),
         fit: BoxFit.cover
         
         ),
         borderRadius: BorderRadius.circular(15.r)
        ),
        );
  }
}