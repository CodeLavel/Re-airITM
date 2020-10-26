import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final introKey = GlobalKey<_WelcomePageState>();

  void _onIntroEnd(context) async {
    //สร้างตัวแปรแบบ SharedPreference
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //เก็บค่าลงตัวแปรแบบ SharedPreference
    sharedPreferences.setInt('appStep', 1);

    //เมื่อทำการเรียกไปหน้าสุดท้าย
    //ส่งไปยังหน้า Loginpage
    Navigator.pushNamed(context, '/');
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(
        'assets/images/welcome/$assetName.jpg',
        width: 350,
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "ยินดีต้อนรับเข้าสู่ระบบ",
          body: "ระบบแจ้งซ่อม พิพิธภัณฑ์เทคโนโลยีสารสนเทศ",
          image: _buildImage('onboard1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "ระบบแจ้งซ่อม",
          body: "สามารถแจ้งซ่อมได้ระบบมือถือ",
          image: _buildImage('onboard2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "การ Scan QR Code",
          body: "สามารถสแกนคิวอาร์โค้ดได้เพื่อแจ้งซ่อมได้",
          image: _buildImage('onboard3'),
          decoration: pageDecoration,
        ),
        // PageViewModel(
        //   title: "Another title page",
        //   body: "Another beautiful body text for this example onboarding",
        //   image: _buildImage('onboard4'),
        //   footer: RaisedButton(
        //     onPressed: () {
        //       // introKey.currentState?.animateScroll(0);
        //     },
        //     child: const Text(
        //       'FooButton',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     color: Colors.lightBlue,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8.0),
        //     ),
        //   ),
        //   decoration: pageDecoration,
        // ),
        PageViewModel(
          title: "ขอบคุณขอให้สนุกกับงานใช้งานแอพพลิเคชัน",
          bodyWidget: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // children: const [
              //   Text("Click on ", style: bodyStyle),
              //   Icon(Icons.edit),
              //   Text(" to edit a post", style: bodyStyle),
              // ],
              ),
          image: _buildImage('onboard5'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('ข้าม'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('เข้าใช้งาน',
          style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
