class CardModel {
  String name;
  String type;
  String rarity;
  String power;
  String toughness;
  int multiverseid;
  String imageUrl;
  List<String> printings;
  String id;

  CardModel({
    this.name,
    this.type,
    this.rarity,
    this.power,
    this.toughness,
    this.multiverseid,
    this.imageUrl,
    this.printings,
    this.id,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    type = json['type'] ?? '';
    rarity = json['rarity'] ?? '';
    power = json['power'] ?? '0';
    toughness = json['toughness'] ?? '0';
    multiverseid = int.parse(json['multiverseid'] ?? '0');
    imageUrl = json['imageUrl'] ?? '';
    printings = json['printings']?.cast<String>()?.toList() ?? [];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['rarity'] = this.rarity;
    data['power'] = this.power;
    data['toughness'] = this.toughness;
    data['multiverseid'] = this.multiverseid;
    data['imageUrl'] = this.imageUrl;
    data['printings'] = this.printings;
    data['id'] = this.id;
    return data;
  }
}
