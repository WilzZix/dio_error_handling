import 'package:dio_test/birds_bloc/bird_facts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactsAboutBirdsPage extends StatefulWidget {
  const FactsAboutBirdsPage({super.key});

  @override
  State<FactsAboutBirdsPage> createState() => _FactsAboutBirdsPageState();
}

class _FactsAboutBirdsPageState extends State<FactsAboutBirdsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BirdFactsCubit>(context).getBirdFacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facts about birds'),
      ),
      body: BlocBuilder<BirdFactsCubit, BirdFactsState>(
        builder: (context, state) {
          if (state is BirdFactsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BirdFactsLoadedState) {
            return ListView.builder(
              itemCount: state.data.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Breed'),
                            Text('${state.data[index].breed}'),
                            Text('country'),
                            Text('${state.data[index].country}'),
                            Text('origin'),
                            Text('${state.data[index].origin}'),
                            Text('coat'),
                            Text('${state.data[index].coat}'),
                            Text('pattern'),
                            Text('${state.data[index].pattern}'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                );
              },
            );
          }
          if (state is BirdFactsLoadError) {
            return Center(
              child: Text(state.msg),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
