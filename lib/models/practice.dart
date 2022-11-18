class Songs {
  final  String name;
  final String category;
  final String url;

  Songs({required this.name, required this.category, required this.url});
}
List<Songs> normalSongs=[
  Songs(name:'wakka wakka',
   category:'Rock' , 
   url:'https://upload.wikimedia.org/wikipedia/en/7/70/Shakirasinglewc.jpg' ),
   Songs(name:'Give Me Freedom' ,
    category: 'Hip Hop',
     url:  'https://images.genius.com/18f0d5db5b934428890086e72ebd58a4.1000x1000x1.jpg'),
     Songs(name: 'Hayya Hayya', 
     category:'Dance',
      url: 'https://i.scdn.co/image/ab67616d0000b27351f2cf37e1ce1fe25ec927df')

];