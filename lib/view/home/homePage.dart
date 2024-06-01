import 'package:findcoloc/themes/theme.dart';
import 'package:findcoloc/view/home/profile/profile.dart';
import 'package:findcoloc/view/home/widget/property_type_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class homePage extends StatefulWidget {
   homePage({super.key});

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Empêcher l'affichage automatique du bouton de retour
        toolbarHeight: 140,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: lightColorScheme.background,
            boxShadow: [
              BoxShadow(
                color: lightColorScheme.outlineVariant.withOpacity(0.3),
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: const Offset(0.0, 1.0),
              ),
            ],
          ),
          child: Stack(
            children: [
              const Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: PropertyTypeList(),
              ),
              Positioned(
                top: 56.0,
                right: 8.0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.tune),
                ),
              ),
              Positioned(
                left: 16.0,
                right: 72.0,
                top: 50.0,
                child: GestureDetector(
                  onTap: () {},
                  child: Hero(
                    tag: 'Search',
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: lightColorScheme.background,
                        border: Border.all(
                          color: lightColorScheme.outlineVariant,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(32.0),
                        boxShadow: [
                          BoxShadow(
                            color: lightColorScheme.outlineVariant,
                            blurRadius: 8.0,
                            offset: const Offset(3.0, 5.0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(height: 6.0),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Find your next roommate',
                                style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Anywhere . Anytime . Anyroommate',
                                style: textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(),
      bottomNavigationBar: Container(
        color: lightColorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: GNav(
            backgroundColor: lightColorScheme.secondary,
            color: lightColorScheme.background,
            activeColor: lightColorScheme.background,
            tabBackgroundColor: lightColorScheme.outlineVariant.withOpacity(0.3),
            haptic: true,
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 900),
            gap: 8,
            iconSize: 25,
            padding: const EdgeInsets.all(16),
            onTabChange: _onItemTapped,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.add_business,
                text: 'Announcement',
              ),
              GButton(
                icon: Icons.message_outlined,
                text: 'Message',
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}