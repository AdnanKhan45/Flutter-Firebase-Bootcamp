class OnBoardingEntity {
  final String title;
  final String description;
  final String image;

  OnBoardingEntity({
    required this.title,
    required this.description,
    required this.image,
  });

  static List<OnBoardingEntity> onBoardingData = [
    OnBoardingEntity(
        title: "Order Your Wish",
        description: "You can order everything,\nyou love to eat.",
        image: "image_1.png"
    ),
    OnBoardingEntity(
        title: "Hot and Spicy",
        description: "Order hot and spicy,\nFOOD with happiness.",
        image: "image_2.png"
    ),
    OnBoardingEntity(
        title: "Happy Cookies",
        description: "Order BEST Cookies,\nand Enjoy.",
        image: "image_3.png"
    ),
  ];
}
