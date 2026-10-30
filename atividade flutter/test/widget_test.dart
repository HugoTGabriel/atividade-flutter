import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cadastro_usuario/main.dart';

void main() {
  testWidgets('Renderiza campos e botao CADASTRAR',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CadastroApp());

    expect(find.text('Cadastro de Usuário'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(5));
    expect(find.text('Nome completo'), findsOneWidget);
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('CPF'), findsOneWidget);
    expect(find.text('Telefone'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'CADASTRAR'), findsOneWidget);
  });

  testWidgets('Valida campos em branco', (WidgetTester tester) async {
    await tester.pumpWidget(const CadastroApp());

    await tester.tap(find.widgetWithText(ElevatedButton, 'CADASTRAR'));
    await tester.pump();

    expect(find.text('Informe o nome completo'), findsOneWidget);
    expect(find.text('Informe o e-mail'), findsOneWidget);
    expect(find.text('Informe o CPF'), findsOneWidget);
    expect(find.text('Informe o telefone'), findsOneWidget);
    expect(find.text('Informe a senha'), findsOneWidget);
  });

  testWidgets('Valida regras de formato e tamanho',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CadastroApp());

    final campos = find.byType(TextFormField);

    await tester.enterText(campos.at(0), 'Hugo');
    await tester.enterText(campos.at(1), 'emailsemarroba');
    await tester.enterText(campos.at(2), '12345678901');
    await tester.enterText(campos.at(3), '11987654321');
    await tester.enterText(campos.at(4), '123');

    await tester.tap(find.widgetWithText(ElevatedButton, 'CADASTRAR'));
    await tester.pump();

    expect(find.text('O e-mail deve conter @'), findsOneWidget);
    expect(find.text('A senha deve ter no mínimo 6 caracteres'), findsOneWidget);
  });

  testWidgets('Exibe SnackBar com dados corretos', (WidgetTester tester) async {
    await tester.pumpWidget(const CadastroApp());

    final campos = find.byType(TextFormField);

    await tester.enterText(campos.at(0), 'Hugo Gabriel');
    await tester.enterText(campos.at(1), 'hugo@dominio.com');
    await tester.enterText(campos.at(2), '12345678901');
    await tester.enterText(campos.at(3), '11987654321');
    await tester.enterText(campos.at(4), 'senha123');

    await tester.tap(find.widgetWithText(ElevatedButton, 'CADASTRAR'));
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Cadastro realizado com sucesso!'), findsOneWidget);
  });
}
