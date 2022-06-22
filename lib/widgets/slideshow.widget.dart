import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool showPoints;

  final Color primaryColor;
  final Color secondaryColor;

  final double primaryBulletSize;
  final double secundaryBulletSize;

  // ignore: use_key_in_widget_constructors
  const SlideShow(
      {required this.slides,
      this.showPoints = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.primaryBulletSize = 12,
      this.secundaryBulletSize = 12});

  @override
  Widget build(BuildContext context) {
    final int numberOfPoints = slides.length;

    return ChangeNotifierProvider(
      create: (_) => _SlishowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SlishowModel>(context).primaryColor = primaryColor;
            Provider.of<_SlishowModel>(context).secondaryColor = secondaryColor;

            Provider.of<_SlishowModel>(context).primaryBulletSize =
                primaryBulletSize;

            Provider.of<_SlishowModel>(context).secundaryBulletSize =
                secundaryBulletSize;

            return _Columnas(
                puntosArriba: showPoints,
                numeroDePuntos: numberOfPoints,
                slides: slides);
          },
        )),
      ),
    );
  }
}

class _Columnas extends StatelessWidget {
  final bool puntosArriba;
  final int numeroDePuntos;
  final List<Widget> slides;

  const _Columnas({
    required this.puntosArriba,
    required this.numeroDePuntos,
    required this.slides,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba) _Dots(numeroDePuntos),
        Expanded(child: _Slides(slides)),
        if (!puntosArriba) _Dots(numeroDePuntos),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int numeroDePuntos;

  const _Dots(this.numeroDePuntos);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(numeroDePuntos, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlishowModel>(context);
    final bool seleccionado = (slideshowModel.currentPage >= index - 0.5 &&
        slideshowModel.currentPage < index + 0.5);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: seleccionado
          ? slideshowModel.primaryBulletSize
          : slideshowModel.secundaryBulletSize,
      height: seleccionado
          ? slideshowModel.primaryBulletSize
          : slideshowModel.secundaryBulletSize,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: seleccionado
              ? slideshowModel.primaryColor
              : slideshowModel.secondaryColor,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViweController = PageController();
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    pageViweController.addListener(() {
      Provider.of<_SlishowModel>(context, listen: false).currentPage =
          pageViweController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViweController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      physics: const BouncingScrollPhysics(),
      controller: pageViweController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlishowModel with ChangeNotifier {
  double _currentPage = 0;
  Color primaryColor = Colors.blue;
  Color secondaryColor = Colors.grey;

  double primaryBulletSize = 12;
  double secundaryBulletSize = 12;

  double get currentPage => _currentPage;
  set currentPage(double pagina) {
    // print('$pagina');
    _currentPage = pagina;
    notifyListeners();
  }
}
