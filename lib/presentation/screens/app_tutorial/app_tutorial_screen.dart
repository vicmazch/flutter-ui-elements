import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final List<SlideInfo> slides = [
  SlideInfo('Buscar la comida', 'Nulla esse est occaecat sit ut cupidatat mollit.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Mollit aute proident pariatur nostrud.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Eu nulla proident et fugiat proident Lorem duis minim ea ex commodo.', 'assets/images/3.png'),
];


class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  late final PageController ctrlPage = PageController();
  bool endReached = false;

  @override
  void initState() {
    ctrlPage.addListener(() { 
      final page = ctrlPage.page ?? 0;
      if( !endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
      debugPrint('::: Page: $page');
    });
    super.initState();
  }

  @override
  void dispose() {
    ctrlPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: ctrlPage,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slide) => _Slide(
              title: slide.title, 
              caption: slide.caption, 
              imageUrl: slide.imageUrl)
            ).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),

          endReached ? Positioned(
            right: 30,
            bottom: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 750),
              child: FilledButton(
                child: const Text('Comenzar'),
                onPressed: () => context.pop(),
              ),
            ),
          ): const SizedBox()
        ],
      )
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    // super.key, 
    required this.title, 
    required this.caption, 
    required this.imageUrl
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
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10,),
            Text(caption, style: captionStyle,),
          ],
        ),
      ),
    );
  }
}