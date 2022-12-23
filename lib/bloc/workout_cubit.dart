import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo/bean/workout_bean.dart';
import 'package:photo/states/workout_states.dart';

class WorkoutCubit extends Cubit<WorkoutStates> {
  WorkoutCubit() : super(const WorkoutInitial());

  editWorkout(WorkoutBean workout, int index) {
    return emit(WorkoutEditing(workout, index, null));
  }

  editExercise(int? exIndex) {
    print("edit index ${exIndex}");
    emit(WorkoutEditing(
        state.workout, (state as WorkoutEditing).index, exIndex));
  }

  goHome() {
    return emit(const WorkoutInitial());
  }
}
