import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:w602/widget/navbar_widget.dart';

class SayurDetail extends StatelessWidget {
  final String assetPath;
  final String sayurprice;
  final String sayurname;

  const SayurDetail({
    super.key,
    required this.assetPath,
    required this.sayurprice,
    required this.sayurname,
  });

  Future<void> _pesanViaWhatsapp(BuildContext context) async {
    const phone = '628123456789';

    final message =
        'Hi Tegar Sayur, Saya mau order $sayurname untuk hari ini, apa bisa diantar kerumah?';

    final uri = Uri.parse(
      'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
    );

    try {
      final ok = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!ok && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tidak dapat membuka WhatsApp'),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Terjadi kesalahan saat membuka WhatsApp'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pesan',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 24.sp,
            color: const Color(0xFF545D68),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF545D68),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              'Sayur Mayur',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Hero(
              tag: assetPath,
              child: Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(assetPath),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: Text(
              'Rp $sayurprice',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: Text(
              sayurname,
              style: TextStyle(
                color: const Color(0xFF575E67),
                fontFamily: 'Varela',
                fontSize: 24.sp,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 52.w,
              child: Text(
                'Sayur mayur yang diambil dari pertanian terbaik di Indonesia akan menjadi bahan dasar terbaik untuk membuat cita rasa masakan nusantara.',
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.sp,
                  color: const Color(0xFFB4B8B9),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 100.w,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () => _pesanViaWhatsapp(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF17532),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.whatsapp,
                      size: 32.sp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Pesan via Whatsapp',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 28.h),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}