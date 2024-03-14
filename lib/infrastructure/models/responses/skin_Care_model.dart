class SkinCareDataModel {
  String title;
  String subTitle;
  String image;
  bool completed;
  DateTime? time;

  SkinCareDataModel({
    this.title='',
    this.subTitle='',
    this.image='',
    this.completed=false,
    this.time,
  });

  factory SkinCareDataModel.fromJson(Map<String, dynamic> json) => SkinCareDataModel(
    title: json["title"],
    subTitle: json["subTitle"],
    completed: json["completed"],
    image: json["image"],
    time: DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subTitle": subTitle,
    "image": image,
    "completed": completed,
    "time": time.toString(),
  };
}
