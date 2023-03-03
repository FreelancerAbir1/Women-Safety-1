import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_1/constant.dart';

class CarouselCard extends StatelessWidget {
  final List carouselImageProduct;

  final int selectedIndex;
  final Function(int, CarouselPageChangedReason) onPageChanged;
  final Function()? onTap;
  const CarouselCard({
    super.key,
    required this.carouselImageProduct,
    required this.selectedIndex,
    required this.onPageChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(
          carouselImageProduct.length,
          (index) => carouselImageProduct.isNotEmpty
              ? GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultPadding - 5),
                      image: DecorationImage(
                        image: NetworkImage(
                          carouselImageProduct[index]['img'],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 200,
                ),
        ),
        options: CarouselOptions(
          height: 200,
          aspectRatio: 1.1,
          viewportFraction: 0.8,
          initialPage: carouselImageProduct.length,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          onPageChanged: onPageChanged,
          scrollDirection: Axis.horizontal,
        ));
  }
}
