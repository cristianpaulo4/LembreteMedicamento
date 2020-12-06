import 'package:lebrete_medicamento/model/doesModel.dart';
import 'package:lebrete_medicamento/model/medicamentoModel.dart';

abstract class IMedicamentoRepository {
  // cadastrar
  Future<bool> cadastrar(MedicamentoModel model, DateTime dateTime);
  // listar medicamentos
  Future<List<MedicamentoModel>> listar();

  Future<List<DoseModel>> listarDoses(int id);
}
