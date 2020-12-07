import 'package:lebrete_medicamento/model/doesModel.dart';
import 'package:lebrete_medicamento/model/medicamentoModel.dart';

abstract class IMedicamentoRepository {
  // cadastrar
  Future<bool> cadastrar(MedicamentoModel model, DateTime dateTime);
  // listar medicamentos
  Future<List<MedicamentoModel>> listar();

  // listar doses para tela de detalhes
  Future<List<DoseModel>> listarDoses(int id);

  // listar doses a serem tomadas
  Future<List<Map>> listarDosesParaTomar();

  // ação de tomar remédio
  Future<bool> tomarRemedio(int id);
  // ação de tomar remédio
  Future<bool> excluirMedicamento(int id);
}
