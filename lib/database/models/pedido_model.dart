import 'package:objectbox/objectbox.dart';

import 'package:flutter_objectbox_examples/database/models/usuario_model.dart';

@Entity()
class Pedido {
  @Id()
  int id = 0;

  final String productName;

  final usuario = ToOne<Usuario>();

  Pedido({
    required this.id,
    required this.productName,
  });
}
