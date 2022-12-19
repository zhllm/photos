import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bean/workout_bean.dart';
import '../bloc/workout_cabit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Time'),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.event_available)),
          IconButton(onPressed: null, icon: Icon(Icons.settings))
        ],
      ),
      body: BlocProvider<WorkoutCubit>(
        create: (BuildContext context) {
          WorkoutCubit workoutCubit = WorkoutCubit();
          if (workoutCubit.state.isEmpty) {
            print("initial");
            workoutCubit.getWorkouts();
          } else {
            print("content is already");
          }
          return workoutCubit;
        },
        child: BlocBuilder<WorkoutCubit, List<WorkoutBean>>(
          builder: (context, state) {
            return Text("Hi there init success");
          },
        ),
      ),
    );
  }
}
