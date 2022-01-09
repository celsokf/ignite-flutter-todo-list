import 'gerencia_de_estado.dart';
import 'shared/models/todo_item.dart';

class HomeController extends GerenciaDeEstado<String> {
  final _toDoItemList = <ToDoItem>[];
  final _doneItemList = <ToDoItem>[];

  HomeController() : super(initialState: "");

  List<ToDoItem> get toDoItemList => _toDoItemList;
  List<ToDoItem> get doneItemList => _doneItemList;

  void onRemoveItem(ToDoItem item) {
    _toDoItemList.remove(item);
    setState(state);
  }

  void onCompleteItem(ToDoItem item) {
    _toDoItemList.remove(item);
    _doneItemList.add(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );
    setState(state);
  }

  void onAddItem(ToDoItem item) {
    _toDoItemList.add(item);
    setState(state);
  }

  void onResetItem(ToDoItem item) {
    _doneItemList.remove(item);
    _toDoItemList.add(
      ToDoItem(title: item.title),
    );
    setState(state);
  }

  void onRemoveDoneItem(ToDoItem item) {
    _doneItemList.remove(item);
    setState(state);
  }
}
