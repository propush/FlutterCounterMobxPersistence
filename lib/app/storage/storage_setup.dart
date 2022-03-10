import 'package:path_provider/path_provider.dart';

late final String fileStoragePath;

Future<void> configureStorage() async {
  final add = await getApplicationDocumentsDirectory();
  fileStoragePath = add.path;
}
