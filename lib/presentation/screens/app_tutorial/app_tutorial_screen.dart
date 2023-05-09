import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Sint esse dolor culpa exercitation cillum non. Dolore nisi ullamco laborum et Lorem ea fugiat ut consectetur. Est dolor cillum sit dolor consectetur voluptate. Fugiat id et ex nisi elit esse cillum amet excepteur tempor consequat non excepteur. Exercitation laboris fugiat esse commodo consequat sunt eu est exercitation aute dolor sint. Reprehenderit ullamco id labore ad id irure labore ut.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Et eiusmod cupidatat sunt officia ex dolor sint consectetur. Eiusmod ut sit enim anim anim magna proident qui eiusmod enim labore eiusmod. Aute aliqua exercitation minim nisi fugiat tempor cupidatat excepteur consectetur velit excepteur deserunt. Sunt nulla consectetur id esse fugiat in cupidatat.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Fugiat fugiat culpa nisi consequat ea anim minim et in. Tempor et elit minim deserunt esse ea deserunt laboris. Laboris consequat nulla Lorem laboris tempor proident. Et id consequat non qui. Aliquip ex ut minim ut elit amet amet incididunt enim amet. Do nisi ut officia culpa sit excepteur id quis qui. Commodo minim cupidatat consequat non esse ipsum excepteur anim sunt aliqua proident amet reprehenderit.',
    'assets/images/3.png',
  ),
];

class ApptutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const ApptutorialScreen({super.key});

  @override
  State<ApptutorialScreen> createState() => _ApptutorialScreenState();
}

class _ApptutorialScreenState extends State<ApptutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 40,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 700),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
