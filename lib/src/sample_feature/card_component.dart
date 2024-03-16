import 'package:flutter/material.dart';
import 'my_tab_bar.dart';

/// Displays detailed information about a card.
class CardComponentView extends StatelessWidget {
  static const routeName = '/card';

  const CardComponentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
                color: Colors.white,
                child: Column(children: [
                  _SampleCard(cardName: 'Elevated Card'),
                ])),
          ]),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 360,
        height: 521,
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(children: [
                Stack(children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(13.0),
                          topRight: Radius.circular(13.0)),
                      child: Image.asset(
                        'images/flag_gradient.png',
                        height: 75,
                        fit: BoxFit.cover,
                      )),
                  Container(
                    alignment: Alignment.center,
                    transform: Matrix4.translationValues(0, -45, 0),
                    child: CircleAvatar(
                      radius: 56,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(5), // Border radius
                        child: ClipOval(
                            child: Image.asset(
                                'images/LinkedIn-Profile-Picture.png')),
                      ),
                    ),
                  ),
                ]),
                Column(children: [
                  Container(
                    transform: Matrix4.translationValues(0, -30, 0),
                    child: const Text(
                      "First Last",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(114, 123, 142, 1)),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -30, 0),
                    child: const Text(
                      "Role | Political Unit",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromRGBO(165, 168, 175, 1)),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'BRANCH: ',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(125, 127, 133, 1))),
                          TextSpan(
                              text: 'EXECUTIVE',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: Color.fromRGBO(165, 168, 175, 1))),
                        ])),
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'PARTY: ',
                              style: TextStyle(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(125, 127, 133, 1))),
                          TextSpan(
                              text: 'DEMOCRAT',
                              style: TextStyle(
                                  fontSize: 9.0,
                                  color: Color.fromRGBO(165, 168, 175, 1))),
                        ])),
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'STATE: ',
                              style: TextStyle(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(125, 127, 133, 1))),
                          TextSpan(
                              text: 'OREGON',
                              style: TextStyle(
                                  fontSize: 9.0,
                                  color: Color.fromRGBO(165, 168, 175, 1))),
                        ])),
                      ],
                    ),
                  )
                ])
              ])),
          LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
            return SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: const TabBarComponent());
          }),
          Stack(children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(13.0),
                    bottomRight: Radius.circular(13.0)),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'images/flag_gradient.png',
                      height: 75,
                      fit: BoxFit.cover,
                    ))),
            const Center(
                heightFactor: 2.6,
                child: Text(
                  "Complete Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0, color: Color.fromRGBO(255, 255, 255, 1)),
                ))
          ]),
        ]));
  }
}

class BannerImage extends StatelessWidget {
  const BannerImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
