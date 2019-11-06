import "package:test/test.dart";
import 'main.dart';

void main() {
  test("challenge 2 a", () {
    expect(sudokuValidator([
      [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
      [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
      [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
      [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
      [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
      [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
      [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
      [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
      [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
    ]), equals(true));
  });

  test("challenge 3 a", () {
    expect(factorSort([9, 7, 13, 12]), equals([12, 9, 13, 7]));
  });

  test("challenge 3 b", () {
    expect(factorSort([9, 9, 13, 12]), equals([12, 9, 9, 13]));
  });

  test("challenge 3 c", () {
    expect(factorSort([9, 4, 9, 4]), equals([9, 9, 4, 4]));
  });


}