// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_objectbox_examples/database/models/pedido_model.dart';
import 'package:flutter_objectbox_examples/home_controller.dart';

import 'search_field.dart';

class PedidosListBySearch extends StatefulWidget {
  final HomeController controller;

  const PedidosListBySearch({
    super.key,
    required this.controller,
  });

  @override
  State<PedidosListBySearch> createState() => _PedidosListBySearchState();
}

class _PedidosListBySearchState extends State<PedidosListBySearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(controller: widget.controller),
        AnimatedBuilder(
          animation: widget.controller.pedidosPesquisados,
          builder: (context, _) => Table(
            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(64),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
              3: FixedColumnWidth(84),
              4: FixedColumnWidth(84),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              _buildHeaderCells(),
              ..._buildRows(widget.controller.pedidosPesquisados.value),
            ],
          ),
        ),
      ],
    );
  }

  TableRow _buildHeaderCells() {
    return const TableRow(children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('id'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Produto'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Usuário'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('VIP?'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Remover'),
      ),
    ]);
  }

  List<TableRow> _buildRows(List<Pedido> rowValues) {
    final tableRows = rowValues
        .map(
          (e) => TableRow(
            children: _buildPedidoRowCells(e),
          ),
        )
        .toList();
    return tableRows;
  }

  List<Widget> _buildPedidoRowCells(Pedido pedido) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(pedido.id.toString()),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(pedido.productName),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(pedido.usuario.target!.name),
      ),
      Container(child: pedido.usuario.target!.vip ? const FlutterLogo() : null),
      IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => widget.controller.deletePedido(pedido.id),
      ),
    ];
  }
}
