// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IntraUser', () {
    const id = 'mock-id';
    const email = 'mock-email';
    test('throws AssertionError when email is null', () {
      expect(
        () => IntraUser(email: null, id: id, name: null, photo: null),
        throwsAssertionError,
      );
    });

    test('throws AssertionError when id is null', () {
      expect(
        () => IntraUser(email: email, id: null, name: null, photo: null),
        throwsAssertionError,
      );
    });

    test('uses value equality', () {
      expect(
        IntraUser(email: email, id: id, name: null, photo: null),
        IntraUser(email: email, id: id, name: null, photo: null),
      );
    });
  });
}
