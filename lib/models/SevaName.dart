class SevaName {
  String _sevaname;
  String _sevadetail;
  int _sevavalue;
  SevaName(this._sevaname, this._sevadetail, this._sevavalue);

  int get sevavalue => _sevavalue;

  set sevavalue(int value) {
    _sevavalue = value;
  }

  String get sevadetail => _sevadetail;

  set sevadetail(String value) {
    _sevadetail = value;
  }

  String get sevaname => _sevaname;

  set sevaname(String value) {
    _sevaname = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SevaName &&
              runtimeType == other.runtimeType &&
              _sevaname == other._sevaname &&
              _sevadetail == other._sevadetail &&
              _sevavalue == other._sevavalue;

  @override
  int get hashCode =>
      _sevaname.hashCode ^
      _sevadetail.hashCode ^
      _sevavalue.hashCode;

  @override
  String toString() {
    return 'SevaName{_sevaname: $_sevaname, _sevadetail: $_sevadetail, _sevavalue: $_sevavalue}';
  }


}