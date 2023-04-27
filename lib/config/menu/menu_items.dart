import 'package:flutter/material.dart';

class MenuItmes {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItmes({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItmes>[
  MenuItmes(
    title: 'Botones',
    subtitle: 'Varios bontones',
    link: '/',
    icon: Icons.smart_button_outlined,
  ),
  MenuItmes(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/card',
    icon: Icons.credit_card,
  ),
];
