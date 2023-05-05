import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subtitle: 'Varios bontones',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: 'Snackbar & Indicators',
    subtitle: 'Indicadores en pantallas',
    link: '/snackbars',
    icon: Icons.info_outline_rounded,
  ),
  MenuItems(
    title: 'Animated container',
    subtitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined,
  ),
  MenuItems(
    title: 'UI Controls + Tiles',
    subtitle: 'Una serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_rounded,
  ),
  MenuItems(
    title: 'Introduction APP',
    subtitle: 'Pequeño tutorial introductorio',
    link: '/tutorial',
    icon: Icons.accessibility_new_rounded,
  ),
];
