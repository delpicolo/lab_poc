class CardModel {
  String name;
  String type;
  String rarity;
  String power;
  String toughness;
  int multiverseid;
  String imageUrl;
  String id;

  CardModel({
    this.name,
    this.type,
    this.rarity,
    this.power,
    this.toughness,
    this.multiverseid,
    this.imageUrl,
    this.id,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    type = json['type'] ?? '';
    rarity = json['rarity'] ?? '';
    power = json['power'] ?? '0';
    toughness = json['toughness'] ?? '0';
    multiverseid = int.parse(json['multiverseid'] ?? '0');
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  bool imageIsEmpty() => this.imageUrl == null;
}
