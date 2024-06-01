import 'package:findcoloc/themes/theme.dart';
import 'package:flutter/material.dart';
class PropertyTypeList extends StatefulWidget {
  const PropertyTypeList({super.key});

  @override
  State<PropertyTypeList> createState() => _PropertyTypeListState();
}

class _PropertyTypeListState extends State<PropertyTypeList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Map<String,dynamic>> propertyTypes = [
      {'type' : 'Apartement', 'icon' : Icons.apartment},
      {'type' : 'House', 'icon' : Icons.home},
      {'type' : 'Shared house', 'icon' : Icons.add_business_rounded},
      {'type' : 'Card', 'icon' : Icons.map},

    ];
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: propertyTypes.length,
        itemBuilder: (context, index) {
          return Container(
            width: size.width * 0.2,
            margin: const EdgeInsets.only(
              right: 4.0,
              left: 4.0,
              top: 4.0,
            ),
            child: Column(
              children: [
                Icon(
                  propertyTypes[index]['icon'],
                  color: lightColorScheme.secondary,
                ),
                const SizedBox(height: 2.0),
                Text(
                  propertyTypes[index]['type'],
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: (index == selectedIndex)
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                (index == selectedIndex)
                    ? Container(
                  margin: const EdgeInsets.only(top: 2.0),
                  height: 2.0,
                  width: 64.0,
                  color: lightColorScheme.shadow,
                )
                    : const SizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}
