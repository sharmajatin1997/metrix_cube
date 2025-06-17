abstract class MatrixEvent {
  const MatrixEvent();
}
class GenerateItems extends MatrixEvent {
  final int row;
  final int column;
  GenerateItems(this.row,this.column);
}


