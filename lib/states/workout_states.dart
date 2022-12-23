import 'package:equatable/equatable.dart';
import 'package:photo/bean/workout_bean.dart';

abstract class WorkoutStates extends Equatable {
  final WorkoutBean? workout;
  final int? elapsed;

  const WorkoutStates(this.workout, this.elapsed);
}

class WorkoutInitial extends WorkoutStates {
  const WorkoutInitial() : super(null, 0);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WorkoutEditing extends WorkoutStates {
  final int index;
  final int? exIndex;

  const WorkoutEditing(WorkoutBean? workout, this.index, this.exIndex)
      : super(workout, 0);

  @override
  // TODO: implement props
  List<Object?> get props => [workout, index, exIndex];
}
