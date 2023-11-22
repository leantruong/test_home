import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_home/features/person/domain/provider/person_providers.dart';
import 'package:test_home/features/person/presentation/provider/state/person_notifier.dart';
import 'package:test_home/features/person/presentation/provider/state/person_state.dart';

final personsNotifierProvider =
    StateNotifierProvider<PersonNotifier, PersonState>((ref) {
  final repository = ref.watch(personsRepositoryProvider);
  return PersonNotifier(repository)..fetchPersons();
});
