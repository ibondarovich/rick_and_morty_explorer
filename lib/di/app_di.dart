import 'package:data/di/data_di.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

class AppDependencies {
  static Future<void> init() async {
    // Initialize data layer dependencies
    DataDependencies.setup();
    
    // Initialize domain layer dependencies
    DomainDependencies.initDependencies();

    // Initialize navigation layer dependencies
    NavigationDependencies.setup();
  }
}
