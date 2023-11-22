import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_home/shared/domain/models/person/person_response.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  static const String routeName = 'DetailScreen';
  const DetailScreen({super.key, required this.model});
  final PersonResponse model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              SectionWidget(
                  title: 'Name', subtitle: '${model.firstname} ${model.lastname}'),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(title: 'Email', subtitle: model.email ?? ''),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(title: 'Phone', subtitle: model.phone ?? ''),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(title: 'Gender', subtitle: model.gender ?? ''),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(
                  title: 'Address',
                  subtitle:
                      '${model.address?.street} ${model.address?.street} ${model.address?.buildingNumber} ${model.address?.city}'),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(title: 'Website', subtitle: model.website ?? ''),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(title: 'Gender', subtitle: model.gender ?? ''),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(
                  title: 'Country', subtitle: model.address?.country ?? ''),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(
                  title: 'Lat', subtitle: model.address?.latitude.toString() ?? ''),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(
                  title: 'Long',
                  subtitle: model.address?.longitude.toString() ?? ''),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(
                  title: 'ZipCode', subtitle: model.address?.zipcode ?? ''),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(
                  title: 'CountryCode', subtitle: model.address?.countyCode ?? ''),
              const SizedBox(
                height: 20,
              ),
              SectionWidget(title: 'Gender', subtitle: model.gender ?? ''),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: Text(title, style: theme.bodyLarge)),
        Expanded(
            flex: 7,
            child: Text(
              subtitle,
              style: theme.bodyLarge,
              textAlign: TextAlign.right,
            )),
      ],
    );
  }
}
