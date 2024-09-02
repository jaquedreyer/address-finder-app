import 'package:cep_finder/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeSut() => const MaterialApp(home: HomePage());

// Teste de validaçao de componenetes (ambiente)
  testWidgets('Verify if the home page contains all required widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeSut());

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
