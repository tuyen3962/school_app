import 'package:school_web_management/common/repo/base_repo.dart';
import 'package:school_web_management/common/repo/storage_repo.dart';
import 'package:school_web_management/common/service/base_service.dart';

class MainRepo {
  static Future<void> initialize() async {
    BaseService.instance;
    await StorageRepo.createInstance();
  }
}
