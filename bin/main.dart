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



sudokuValidator(List<List> board){
  bool checkRows(List<List> board) {
    for(int i =0; i < 9; i++){
      if(board[i].toSet().length != 9){
        return false;
      }
    }
    return true;
  }
  transposeMatrix(List<List> matrix) {
    List<List> transpose = List<List>();
      for (int i = 0; i < matrix[0].length; i++) {
        List newList = List();
        matrix.forEach((list) => {newList.add(list[i])});
        transpose.add(newList);
    }
    return transpose;
  }
  bool checkCols(){
    List<List> transpose = transposeMatrix(board);
    return checkRows(transpose);
  }
  bool checkBlock(){
    List newRow = List();
    for(int i = 0; i < 9; i += 3){
      for(int j = 0; j < 9; j += 3){
        for(int a = i; a < i + 3; a++){
          for(int b = j; b < j + 3; b++){
            newRow.add(board[a][b]);
            }
          }
        //print(newRow);
        if(newRow.toSet().length != 9){
          return false;
        }
        newRow = [];
      }
    }
    return true;
    }
    return checkRows(board) && checkCols() && checkBlock();
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

List factorSort(List<int> numbers){
  int factors(int number) {
    int factor = 0;
    for(int i =1;i<number;i++){
      if(number % i ==0){
        factor++;
      }
    }
    return factor;
  }
  numbers.sort((a,b) => factors(b).compareTo(factors(a)) != 0 ? factors(b).compareTo(factors(a)) : b.compareTo(a));
  return numbers;
}


main() {

  print(  sudokuValidator([
    [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
    [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
    [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
    [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
    [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
    [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
    [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
    [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
    [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
  ]));

  print(factorSort([9, 7, 13, 12]));
  print(factorSort([9, 9, 13, 12]));
  print(factorSort([9, 4, 9, 4]));


}
