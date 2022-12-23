import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo/bloc/workout_cubit.dart';
import 'package:photo/utils/time_helper.dart';

import '../bean/workout_bean.dart';
import '../bloc/workouts_cabit.dart';

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
      body: SingleChildScrollView(
        child: BlocBuilder<WorkoutsCubit, List<WorkoutBean>>(
          builder: (context, works) => ExpansionPanelList.radio(
            children: works
                .map(
                  (workout) => ExpansionPanelRadio(
                    value: workout,
                    headerBuilder: (BuildContext context, bool isExpand) {
                      return ListTile(
                        visualDensity: const VisualDensity(
                          horizontal: 0,
                          vertical: VisualDensity.maximumDensity,
                        ),
                        leading: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            BlocProvider.of<WorkoutCubit>(context)
                                .editWorkout(workout, works.indexOf(workout));
                          },
                        ),
                        trailing:
                            Text(formatTime(workout.getTotalTime(), true)),
                        title: Text(workout.title ?? ""),
                      );
                    },
                    body: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: null,
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.maximumDensity,
                          ),
                          leading: Text(formatTime(
                              workout.exercises![index].prelude ?? 0, true)),
                          title: Text(workout.exercises![index].title ?? ""),
                          trailing: Text(formatTime(
                              workout.exercises![index].duration!, true)),
                        );
                      },
                      itemCount: workout.exercises?.length,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
