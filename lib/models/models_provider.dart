import 'package:flutter/cupertino.dart';
import 'package:openai_chat_gpt_flutter/repository/api_repo.dart';

import 'models_model.dart';

class ModelsProvider extends ChangeNotifier {
  String currentModel = "text-davinci-003";
  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<ModelModels> modelList = [];
  List<ModelModels> get getModelList {
    return modelList;
  }

  Future<List<ModelModels>>getAllModels () async{
    modelList = await APIservice.getNodelData();
    return modelList;
  }
}
