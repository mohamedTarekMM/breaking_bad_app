class CharacterModel {
  int? charId;
  String? name;
  String? birthday;
  List<dynamic>? jobs;
  String? img;
  String? status;
  String? nickname;
  List<dynamic>? appearance;
  String? portrayed;
  String? category;
  List<dynamic>? betterCallSaulAppearance;


  CharacterModel(
      {this.charId,
        this.name,
        this.birthday,
        this.jobs,
        this.img,
        this.status,
        this.nickname,
        this.appearance,
        this.portrayed,
        this.category,
        this.betterCallSaulAppearance
        });

  CharacterModel.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    jobs = json['occupation'];
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    portrayed = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['char_id'] = charId;
    data['name'] = name;
    data['birthday'] = birthday;
    data['occupation'] = jobs;
    data['img'] = img;
    data['status'] = status;
    data['nickname'] = nickname;
    data['appearance'] = appearance;
    data['portrayed'] = portrayed;
    data['category'] = category;
    data['better_call_saul_appearance']=betterCallSaulAppearance;
    return data;
  }
}
class Quotes{
  String? quote;

  Quotes(this.quote);

  Quotes.fromJson(Map<String,dynamic>json){
    quote = json['quote'];
  }
}
