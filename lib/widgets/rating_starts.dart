import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
    RatingStars(this.rating,this.size, {super.key});
  int rating;
  double size;

  @override
  Widget build(BuildContext context) {
    String stars="";
    // for(int i=0;i<rating;i++){
    //   stars+="* ";
    // }
    while(rating>0){
      stars+="* ";
      rating--;
    }
    stars.trim();
    return Text(stars,
    style: TextStyle(color: Colors.orangeAccent,fontSize: size),
    );
  }
}
