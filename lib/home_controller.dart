import 'package:mobx/mobx.dart';

import 'shared/models/todo_item.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ToDoItem> toDoItemList = ObservableList<ToDoItem>();

  @observable
  ObservableList<ToDoItem> doneItemList = ObservableList<ToDoItem>();

  @observable
  int selectedIndex = 0;

  @computed
  int get toDoItemListLength => toDoItemList.length;

  @computed
  int get doneItemListLength => doneItemList.length;

  @action
  void onRemoveItem(ToDoItem item) {
    toDoItemList.remove(item);
  }

  @action
  void onCompleteItem(ToDoItem item) {
    toDoItemList.remove(item);
    doneItemList.add(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );
  }

  @action
  void onAddItem(ToDoItem item) {
    toDoItemList.add(item);
  }

  @action
  void onResetItem(ToDoItem item) {
    doneItemList.remove(item);
    toDoItemList.add(
      ToDoItem(title: item.title),
    );
  }

  @action
  void onRemoveDoneItem(ToDoItem item) {
    doneItemList.remove(item);
  }

  @action
  // ignore: use_setters_to_change_properties
  void setSelectedIndex(int index) => selectedIndex = index;
}
