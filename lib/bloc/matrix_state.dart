import 'package:equatable/equatable.dart';

class MatrixState extends Equatable{
  final int rows;
  final int columns;
  final List<List<int>> matrix;

  const MatrixState({
    this.matrix=const[],
    this.columns=0,
    this.rows=0,
  });

  MatrixState copyWith({int? rows, int? columns, List<List<int>>? matrix}) {
    return MatrixState(
      rows: rows ?? this.rows,
      columns: columns ?? this.columns,
      matrix: matrix ?? this.matrix,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [rows,columns,matrix];
}