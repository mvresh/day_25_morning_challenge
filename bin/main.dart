// Challenge 1
// Write Test cases for given challenges

// Challenge 2
// Sudoku Validation
// Write a sudoku validator. This function should return true if the 2-D array represents a valid sudoku and false otherwise. To be a valid sudoku:
//
// - Each row must have the digits from 1 to 9 exactly once.
// - Each column must have the digits from 1 to 9 exactly once.
// - Each 3x3 box must have the digits from 1 to 9 exactly once.
// Examples
//  sudokuValidator([
//  [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
//  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
//  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
//  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
//  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
//  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
//  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
//  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
//  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
//  ]) ➞ true


sudokuValidator(List<List> board) {
  valid(List list) {
    for(int i = 0; i < list.length; i++){
      if(list[i] > 9 || list[i] < 0){
        return false;
      }
    }
    return list.toSet().length == 9;
  }

  bool checkRowsAndCols(List<List> board) {
    List colList = [];
    for (int i = 0; i < 9; i++) {
      if(valid(board[i])) {
        for (int j = 0; j < 9; j++) {
          colList.add(board[j][i]);
        }
        if(valid(colList)){
          colList.clear();
        }
        else{
          return false;
        };
      }
      else{
        return false;
      }
    }
    return true;
  }

  bool checkBlock(List<List> board) {
    List block = List();
    for (int i = 0; i < 9; i += 3) {
      for (int j = 0; j < 9; j += 3) {
        for (int a = i; a < i + 3; a++) {
          for (int b = j; b < j + 3; b++) {
            block.add(board[a][b]);
          }
        }
        if(valid(block)){
          block.clear();
        }
        else{
          return false;
        }
      }
    }
    return true;
  }

  return checkRowsAndCols(board) && checkBlock(board);
}

// Challenge 3
// Sort by Factor Length
// A numbers factor length is simply its total number of factors.
// Create a function that sorts an array by factor length in descending order.
// If multiple numbers have the same factor length, sort these numbers in descending order, with the largest first.
//
// In the example below, since 13 and 7 both have only 2 factors, we put 13 ahead of 7.
//
// factorSort([9, 7, 13, 12]) ➞ [12, 9, 13, 7]

List factorSort(List<int> numbers) {
  int factors(int number) {
    int factor = 0;
    for (int i = 1; i < number; i++) {
      if (number % i == 0) {
        factor++;
      }
    }
    return factor;
  }

  numbers.sort((a, b) => factors(b).compareTo(factors(a)) != 0
      ? factors(b).compareTo(factors(a))
      : b.compareTo(a));
  return numbers;
}

main() {
  print(sudokuValidator([
    [1, 5, 2, 4, 8, 9, 3, 7, 6],
    [7, 3, 9, 2, 5, 6, 8, 4, 1],
    [4, 6, 8, 3, 7, 1, 2, 9, 5],
    [3, 8, 7, 1, 2, 4, 6, 5, 9],
    [5, 9, 1, 7, 6, 3, 4, 2, 8],
    [2, 4, 6, 8, 9, 5, 7, 1, 3],
    [9, 1, 4, 6, 3, 7, 5, 8, 2],
    [6, 2, 5, 9, 4, 8, 1, 3, 7],
    [8, 7, 3, 5, 1, 2, 9, 6, 4]
  ]));

  print(sudokuValidator([
    [1, 5, 5, 4, 8, 9, 3, 7, 6],
    [7, 3, 9, 2, 5, 6, 8, 4, 1],
    [4, 6, 8, 3, 7, 1, 2, 9, 5],
    [3, 8, 7, 1, 2, 4, 6, 5, 9],
    [5, 9, 1, 7, 6, 3, 4, 2, 8],
    [2, 4, 6, 9, 9, 5, 7, 1, 3],
    [9, 1, 4, 6, 3, 7, 5, 8, 2],
    [6, 2, 5, 9, 4, 8, 1, 3, 7],
    [8, 7, 7, 5, 1, 2, 9, 2, 4]
  ]));

  print(sudokuValidator([
    [1, 5, 2, 4, 80, 9, 3, 7, 6],
    [7, 3, 9, 2, 5, 6, 8, 4, 1],
    [4, 6, 8, 3, 7, 1, 2, 9, 5],
    [3, 8, 7, 1, 2, 4, 6, 5, 9],
    [5, 9, 1, 7, 6, 3, 4, 2, 8],
    [2, 4, 6, 8, 9, 5, 7, 1, 3],
    [9, 1, 4, 6, 3, 7, 5, 8, 2],
    [6, 2, 5, 9, 4, 8, 1, 3, 7],
    [8, 7, 3, 5, 1, 2, 9, 6, 4]
  ]));


  print(sudokuValidator([
    [1, 5, 2, 4, 8, 9, 3, 7, 6],
    [7, 3, 9, 2, 5, 6, 8, 4, 1],
    [4, 6, 8, 3, 7, 1, 2, 9, 5],
    [3, 8, 7, 1, 2, 4, 6, 5, 9],
    [5, 9, 1, 7, 6, 3, 4, 2, 8],
    [2, 4, 6, 8, 9, 5, 7, 1, 3],
    [9, 1, 4, 6, 3, 7, 5, 8, 2],
    [-6, 2, 5, 9, 4, 8, 1, 3, 7],
    [8, 7, 3, 5, 1, 2, 9, 6, 4]
  ]));

  print(sudokuValidator([
    [1, 2, 3, 4, 5, 6, 7, 8, 9],
    [2, 3, 4, 5, 6, 7, 8, 9, 1],
    [3, 4, 5, 6, 7, 8, 9, 9, 2],
    [4, 5, 6, 7, 8, 9, 6, 2, 3],
    [5, 6, 7, 8, 9, 3, 2, 3, 4],
    [6, 7, 8, 9, 9, 2, 3, 4, 5],
    [7, 8, 9, 6, 2, 3, 4, 5, 6],
    [8, 9, 5, 2, 3, 4, 5, 6, 7],
    [9, 1, 2, 3, 4, 5, 6, 7, 8]
  ]));

  print(factorSort([9, 7, 13, 12]));
  print(factorSort([9, 9, 13, 12]));
  print(factorSort([9, 4, 9, 4]));
}
