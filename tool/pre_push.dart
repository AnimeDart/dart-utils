import 'shell.dart';

void main(List<String> args) async {
  await shell.run('pub run test');
  await shell.run('flutter analyze');
}
