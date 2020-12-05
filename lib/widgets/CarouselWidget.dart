import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      options: CarouselOptions(
        enableInfiniteScroll: true,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index) {
        var string = ['Beautiful UI', 'Expressive', 'Customizable'];
        var diary = ['diary.jpeg', 'diary2.jpeg', 'diary3.jpeg'];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFFd1c4e9),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(string[index]),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                      Container(child: Image.asset("images/${diary[index]}")),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
