import 'package:flutter_objectbox_examples/database/models/usuario_model.dart';
import 'package:flutter_objectbox_examples/main.dart';

class UsuarioDAO {
  int putUsuario(
    Usuario usuario,
  ) {
    final box = objectbox.store.box<Usuario>();
    return box.put(usuario);
  }

  Usuario? getUsuario(
    int id,
  ) {
    final box = objectbox.store.box<Usuario>();
    return box.get(id);
  }

  List<Usuario> getAllUsuario() {
    final box = objectbox.store.box<Usuario>();
    return box.getAll();
  }

  bool removeUsuario(
    int id,
  ) {
    final box = objectbox.store.box<Usuario>();
    return box.remove(id);
  }

  int countUsuario(
    int id,
  ) {
    final box = objectbox.store.box<Usuario>();
    return box.count();
  }

  //Queries
}
