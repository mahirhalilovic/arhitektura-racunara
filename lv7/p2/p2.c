#include <stdio.h>

// static void partition_impl(int* first, int* last, int (*predicate)(int)) {
//   if (first == last) return;

//   if (predicate(*first)) {
//    int temp = *first;
//    *first = *last;
//    *last = temp;
//    --last;
//  } else {
//    ++first;
//  }
//  partition_impl(first, last, predicate);

// }

/* void partition(int* arr, int size, int (*predicate)(int)) { */
/*   if (size < 2) return; */
/*   partition_impl(arr, arr + size - 1, predicate); */
/* } */

int niz[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

int isEven(int n) { return n % 2 == 0; }

// std::function<int(int)> predicate;
void partition(int*, int, int (*predicate)(int));

int main(void) {
  partition(niz, 9, isEven);
  int i;
  for (i = 0; i < 9; ++i) {
    printf("%d ", niz[i]);
  }
  printf("\n");
  return 0;
}
