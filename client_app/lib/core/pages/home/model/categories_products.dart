class CayegoryProducts {
  final String title;
  final String detail;
  final String icon;

  CayegoryProducts({
    required this.title,
    required this.detail,
    required this.icon,
  });
}

final homeCayegoryProductss = <CayegoryProducts>[
  CayegoryProducts(
    title: "Today’s Special!",
    detail: 'Get discount for every order, only valid for today',
    icon: 'assets/icons/products/sofa.png',
  ),
  CayegoryProducts(
    title: "Tomorrow will be better!",
    detail: 'Please give me a star!',
    icon: 'assets/icons/products/shiny_chair.png',
  ),
  CayegoryProducts(
    title: "Not discount today!",
    detail: 'If you have any problem, contact me',
    icon: 'assets/icons/products/lamp.png',
  ),
  CayegoryProducts(
    title: "It's for you!",
    detail: 'Wish you have a funny time',
    icon: 'assets/icons/products/plastic_chair@2x.png',
  ),
  CayegoryProducts(
    title: "Make yourself at home!",
    detail: 'If you have any confuse, let me now',
    icon: 'assets/icons/products/book_case@2x.png',
  ),
];
