class StepModel {
  final int id;
  final String text;

  StepModel({this.id, this.text});

  static List<StepModel> list = [
    StepModel(
      id: 1,
      text: "ICT Guide Applicaiton \nis for all IT student\nall over the nepal",
    ),
    StepModel(
      id: 2,
      text:
          "Your order will be\nimmediately collected and\nsent by our courier",
    ),
    StepModel(
      id: 3,
      text: "Pick update delivery\nat your door and enjoy\ngroceries",
    ),
  ];
}
