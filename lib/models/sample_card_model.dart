class SampleCardModel{
  final String url;
  final String name;
  final String category;

  SampleCardModel({required this.url,required this.name,required this.category});
  factory SampleCardModel.factoryfromJson(Map<String, dynamic> json){
    return SampleCardModel(
      url: json['url'],
       name: json['name'],
       category: json['category']
       );
  } 
   Map<String, dynamic> toJson(){
    return {
      'url':url,
      'name':name,
      'category':category,
      
    };
   }
}