import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_sum/bloc/matrix_bloc.dart';
import 'package:matrix_sum/bloc/matrix_event.dart';
import 'package:matrix_sum/bloc/matrix_state.dart';
import 'package:matrix_sum/presentation/two_dimension_scroll.dart';

class MatrixScreen extends StatelessWidget {
   MatrixScreen({super.key});

  final rowController = TextEditingController();
  final columnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Matrix Grid with Sum')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: rowController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Row'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: columnController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Column'),
                  ),
                ),
                SizedBox(width: 10),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      final r = int.tryParse(rowController.text) ?? 0;
                      final c = int.tryParse(columnController.text) ?? 0;
                      context.read<MatrixBloc>().add(GenerateItems(r, c));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Generate',
                        style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<MatrixBloc, MatrixState>(
                builder: (context, state) {
                  return Scrollbar(
                    child: TwoDimensionalScrollWidget(
                      child: Column(
                        children: [
                          for (int i = 0; i < state.rows; i++)
                            Row(
                              children: [
                                for (int j = 0; j < state.columns; j++)
                                  Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.amber,
                                    margin: EdgeInsets.all(4),
                                    child: Center(child: Text(state.matrix[i][j].toString())),
                                  ),
                              ],
                            ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final state = context.read<MatrixBloc>().state;
                print('Submitted Matrix: ${state.matrix}');
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}




