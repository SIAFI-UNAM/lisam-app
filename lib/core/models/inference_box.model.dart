class InferenceeBox {
  final int xMin;
  final int xMax;
  final int yMin;
  final int yMax;

  InferenceeBox(this.xMin, this.xMax, this.yMin, this.yMax);

  factory InferenceeBox.fromMap(Map<String, dynamic> map) => InferenceeBox(
        map['xMin'],
        map['xMax'],
        map['yMin'],
        map['yMax'],
      );
}
