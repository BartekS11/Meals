import 'package:flutter/material.dart';

class FilterSwitchListTile extends StatelessWidget {
  const FilterSwitchListTile({
    super.key,
    required this.filterType,
    required this.filterName,
    required this.onChecked,
  });

  final bool filterType;
  final String filterName;
  final void Function(bool isChecked) onChecked;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterType,
      onChanged: onChecked,
      title: Text(
        filterName,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        'Only include $filterName meals'.toLowerCase(),
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
