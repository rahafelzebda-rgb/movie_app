import 'package:movie_app/common/gen/assets.gen.dart';

class OnbordingData {
  final String image;
  final String title;
  final String description;
  final String buttomText;
  final bool showBackButtom;
  const OnbordingData({
    required this.image,
    required this.title,
    required this.description,
    required this.buttomText,
    required this.showBackButtom,
  });
}

final List<OnbordingData> onbordingList = [
  OnbordingData(
    image: Assets.images.onbording1.path,
    title: "Find your next favorite movie here",
    description:
        "Get access to a huge library of movies to suit all tastes . You will surly lik it.",
    buttomText: "Explore Now",
    showBackButtom: false,
  ),
   OnbordingData(
    image: Assets.images.onbording2.path,
    title: "Discover Movies",
    description:
        "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    buttomText: "Next",
    showBackButtom: false,
  ),
   OnbordingData(
    image: Assets.images.onbording3.path,
    title: "Explore All Generes",
    description:
        "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    buttomText: "Next",
    showBackButtom: true,
  ),
   OnbordingData(
    image: Assets.images.onbording4.path,
    title: "Create WatchLists",
    description:
        "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    buttomText: "Next",
    showBackButtom: true,
  ),
   OnbordingData(
    image: Assets.images.onbording5.path,
    title: "Rate, Review, and Learn",
    description:
        "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    buttomText: "Next",
    showBackButtom: true,
  ),
   OnbordingData(
    image: Assets.images.onbording6.path,
    title: "Start Watching Now",
    description:
        "",
    buttomText: "Finish",
    showBackButtom: true,
  ),
  
];

