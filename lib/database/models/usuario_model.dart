// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

import 'package:flutter_objectbox_examples/database/models/pedido_model.dart';

@Entity()
class Usuario {
  @Id()
  int id = 0;

  String name;
  
  bool vip;

  @Backlink()
  final pedido = ToMany<Pedido>();

  Usuario({
    required this.id,
    required this.name,
    required this.vip,
  });
}
