import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_home/routes/app_router.dart';

import '../provider/person_state_provider.dart';
import '../provider/state/person_state.dart';

@RoutePage()
class PersonListScreen extends ConsumerStatefulWidget {
  static const String routeName = 'PersonListScreen';

  const PersonListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PersonListScreen> createState() => _PersonListScreenState();
}

class _PersonListScreenState extends ConsumerState<PersonListScreen> {
  final scrollController = ScrollController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void scrollControllerListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(personsNotifierProvider.notifier);
      notifier.fetchPersons();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(personsNotifierProvider);
    final theme = Theme.of(context).textTheme;

    ref.listen(
      personsNotifierProvider.select((value) => value),
      ((PersonState? previous, PersonState next) {}),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
      ),
      body: state.state == PersonFetchState.loading
          ? const Center(child: CircularProgressIndicator())
          : state.hasData
              ? RefreshIndicator(
                  onRefresh: () async {
                    ref
                        .read(personsNotifierProvider.notifier)
                        .fetchPersons(isRefresh: true);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Scrollbar(
                          controller: scrollController,
                          child: ListView.separated(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            separatorBuilder: (_, __) => const SizedBox(),
                            controller: scrollController,
                            itemCount: state.personList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final data = state.personList[index];
                              return Card(
                                elevation: 3,

                                child: ListTile(
                                    onTap: () {
                                        AutoRouter.of(context).push(DetailRoute(model: data));
                                    },
                                  leading: Image.network(
                                    data.image ?? '',
                                    width: 40,
                                    height: 40,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Container(
                                        width: 40,
                                        height: 40,                          
                                        decoration: const BoxDecoration(
                                             color: Colors.grey,
                                            shape: BoxShape.circle),
                                        child: Icon(data.gender == 'male'
                                            ? Icons.man_2
                                            : Icons.woman,
                                            color: Colors.white,
                                            ),
                                      );
                                    },
                                  ),
                                  title: Text(
                                    '${data.firstname} ${data.lastname}',
                                    style: theme.bodyLarge,
                                  ),
                                  subtitle: Text(
                                    data.email ?? '',
                                    style: theme.bodyMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      if (state.state == PersonFetchState.fetchingMore)
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      if (state.state ==
                          PersonFetchState.completeFetchingMore) ...[
                        const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Nothing more to load')),
                        const SizedBox(height: 16.0)
                      ]
                    ],
                  ),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
    );
  }
}
