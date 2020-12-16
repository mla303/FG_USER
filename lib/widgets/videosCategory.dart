// List VideoCatgList = [
//
//   VideoCatg(
//       SongName:"Hop",
//       imgUrl: "Images/videoAssets/video1.png"
//   ),
//   VideoCatg(
//       SongName:"Fakie",
//       imgUrl: "Images/videoAssets/video2.png"
//   ),
//   VideoCatg(
//       SongName:"Nose pivot",
//       imgUrl: "Images/videoAssets/video3.png"
//   ),
//
// ];

class VideoCat{
  String SongName;
  String imgUrl;

  VideoCat({this.SongName,this.imgUrl,});

}


class Catogary{
  String imageUrl;
  String title;

  Catogary({this.title,this.imageUrl});

}


List CatogartData= [

  Catogary(
      title:"Beginner",
      imageUrl: "Images/beginner.jpeg"
  ),
  Catogary(
      title:"Intermediate",
      imageUrl: "Images/intermediate.jpeg"
  ),
  Catogary(
      title:"Advanced",
      imageUrl: "Images/advance.jpeg"
  ),
  Catogary(
      title:"Elite",
      imageUrl: "Images/elite.jpeg"
  ),
  Catogary(
      title:"Flatgod",
      imageUrl: "Images/flatgod.jpeg"
  ),

];