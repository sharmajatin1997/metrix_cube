import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_sum/bloc/matrix_event.dart';
import 'package:matrix_sum/bloc/matrix_state.dart';

class MatrixBloc extends Bloc<MatrixEvent, MatrixState> {

  MatrixBloc() : super(MatrixState()){
    on<GenerateItems>(_createItems);
  }

  void _createItems(GenerateItems event, Emitter<MatrixState> emit) {
    final matrix = List.generate(event.row, (i) => List.generate(event.column, (j) =>
        i < state.rows && j < state.columns ? state.matrix[i][j] : 0));
    emit(state.copyWith(rows: event.row,columns: event.column,matrix: matrix));
  }

}