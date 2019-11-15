import 'package:app_api/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key key}) : super(key: key);

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => new HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to Flutter",
            body:
                "Bacon ipsum dolor amet brisket leberkas tail fatback chuck sausage buffalo spare ribs landjaeger.",
            image: Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Center(
                child: FlutterLogo(size: 300.0)),
            ),
            decoration: const PageDecoration(
              pageColor: Colors.white,
            ),
          ),
          PageViewModel(
            title: "Easily Manage Your Patient's Data",
            body:
                "Bacon ipsum dolor amet brisket leberkas tail fatback chuck sausage buffalo spare ribs landjaeger.",
            image: Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Center(
                child: Image.asset("lib/assets/undraw_fitting_piece_iilo.png", height: 300.0)),
            ),
            decoration: const PageDecoration(
              pageColor: Colors.white,
            ),
          ),
          PageViewModel(
            title: "Keme keme",
            body:
                "Lorem ipsum keme keme keme 48 years fayatollah kumenis bella pinkalou na ang conalei jowabella ",
            image: Center(
                child: Image.asset("lib/assets/undraw_modern_art_x3qc.png", height: 200.0)),
            decoration: const PageDecoration(
              pageColor: Colors.white,
            ),
          ),
          PageViewModel(
            title: "Title here",
            body:
                "Description here",
            image: Center(
                child: Image.asset("lib/assets/undraw_progressive_app_m9ms.png", height: 175.0)),
            decoration: const PageDecoration(
              pageColor: Colors.white,
            ),
          ),
          PageViewModel(
            title: "Title here",
            body:
                "Lorem ipsum keme keme keme 48 years fayatollah kumenis bella pinkalou na ang conalei jowabella",
            image: Center(
                child: Image.asset("lib/assets/undraw_quiz_nlyh.png", height: 175.0)),
            decoration: const PageDecoration(
              pageColor: Colors.white,
            ),
          ),
          PageViewModel(
            title: "Title here",
            body:
                "orem ipsum keme keme keme 48 years fayatollah kumenis bella pinkalou na ang conalei jowabella",
            image: Center(
                child: Image.asset("lib/assets/undraw_winter_road_mcqj.png", height: 175.0)),
            decoration: const PageDecoration(
              pageColor: Colors.white,
            ),
          ),
        ],
        showSkipButton: true,
        onDone: ()=> this._onIntroEnd(context),
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ));
  }
 
}