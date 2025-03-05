class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

List<BoardingModel> boarding = [
  BoardingModel(
    image: "assets/images/onboarding_1.png",
    title: "title1",
    body: "body1",
  ),
  BoardingModel(
    image: "assets/images/onboarding_2.png",
    title: "title2",
    body: "body2",
  ),
  BoardingModel(
    image: "assets/images/onboarding_3.png",
    title: "title3",
    body: "body3",
  ),
];
