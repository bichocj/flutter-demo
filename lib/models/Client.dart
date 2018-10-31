class Client {
  int _id;
  String _name;
  String _lastname;
  Client(this._name, this._lastname);

  Client.map(dynamic obj) {
    this._id = obj["id"];
    this._name = obj["name"];
    this._lastname = obj["last_name"];
  }

  int get id => _id;
  String get name => _name;
  String get lastname => _lastname;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["name"] = _name;
    map["last_name"] = _lastname;

    return map;
  }
}