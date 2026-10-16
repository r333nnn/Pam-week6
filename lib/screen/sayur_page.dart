import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w602/screen/sayur_detail.dart';

class Sayur {
  final String name;
  final String imageUrl;
  final int price;
  final bool isFavorite;

  const Sayur({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });
}

class SayurPage extends StatelessWidget {
  const SayurPage({super.key});

  List<Sayur> get listSayurs => const [
        Sayur(
          name: 'Bayam',
          imageUrl: 'assets/1.jpeg',
          price: 5000,
        ),
        Sayur(
          name: 'Cabai',
          imageUrl: 'assets/2.jpeg',
          price: 6000,
        ),
        Sayur(
          name: 'Kentang',
          imageUrl: 'assets/3.jpeg',
          price: 12000,
        ),
        Sayur(
          name: 'Sawi',
          imageUrl: 'assets/4.jpeg',
          price: 3000,
        ),
        Sayur(
          name: 'Terong',
          imageUrl: 'assets/5.jpeg',
          price: 3000,
        ),
        Sayur(
          name: 'Tomat',
          imageUrl: 'assets/6.jpeg',
          price: 3000,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: Padding(
        padding: EdgeInsets.only(bottom: 80.h),
        child: GridView.builder(
          padding: EdgeInsets.all(4.r),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 0.78,
          ),
          itemCount: listSayurs.length,
          itemBuilder: (context, index) {
            return _buildCard(listSayurs[index], context);
          },
        ),
      ),
    );
  }

  Widget _buildCard(Sayur sayur, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SayurDetail(
                assetPath: sayur.imageUrl,
                sayurprice: sayur.price.toString(),
                sayurname: sayur.name,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 8.w,
                  top: 4.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      sayur.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: const Color(0xFFEF7532),
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 76.h,
                width: 92.w,
                child: Image.asset(
                  sayur.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Rp ${sayur.price}',
                style: TextStyle(
                  color: const Color(0xFFCC8053),
                  fontFamily: 'Varela',
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Text(
                  sayur.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 5.h,
                ),
                child: Container(
                  color: const Color(0xFFEBEBEB),
                  height: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.w,
                  right: 4.w,
                  bottom: 6.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.chat,
                            color: const Color(0xFFD17E50),
                            size: 15.sp,
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            'Chat',
                            style: TextStyle(
                              fontFamily: 'Varela',
                              color: const Color(0xFFD17E50),
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.remove_circle_outline,
                          color: const Color(0xFFD17E50),
                          size: 15.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '3',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: const Color(0xFFD17E50),
                            fontWeight: FontWeight.bold,
                            fontSize: 11.sp,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.add_circle_outline,
                          color: const Color(0xFFD17E50),
                          size: 15.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}