import 'package:eslamicapp/featchers/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  void _onIntroEnd(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 18);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: 40),
    );

    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,

        pages: [
          PageViewModel(
            title: "القرآن الكريم",
            body:
                "اقرأ القرآن الكريم بخط واضح وتصميم جميل مع إمكانية الاستماع للتلاوات",
            image: Image.asset("assets/images/1.png"),
            decoration: pageDecoration,
          ),

          PageViewModel(
            title: "مواقيت الصلاة",
            body: "تنبيهات دقيقة لمواقيت الصلاة حسب موقعك مع صوت الأذان",
            image: Image.asset("assets/images/2.png"),
            decoration: pageDecoration,
          ),

          PageViewModel(
            title: "رفيقك الروحاني",
            body:
                "تذكيرات يومية، أذكار، تسبيح، وكل ما تحتاجه في رحلتك الإيمانية",
            image: Image.asset("assets/images/3.png"),
            decoration: pageDecoration,
          ),
        ],

        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Icon(Icons.arrow_forward),
        done: const Text("Done"),

        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),

        dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
      ),
    );
  }
}
