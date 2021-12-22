class Slide {
  String main;
  String? title;
  String? subtitle;
  Slide({required this.main, this.title, this.subtitle});

  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
        main: json["main"], title: json["title"], subtitle: json["subtitle"]);
  }
}
