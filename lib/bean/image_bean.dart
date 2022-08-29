class ImageBean {
  String? addr;
  int? category1;
  int? category2;
  int? id;

  ImageBean.fromMap(Map<String, dynamic> map) {
    this.addr = map["addr"];
    this.category1 = map["category1"];
    this.category2 = map["category2"];
    this.id = map["id"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map();
    map["addr"] = this.addr;
    map["category1"] = this.category1;
    map["category2"] = this.category2;
    return map;
  }
}
