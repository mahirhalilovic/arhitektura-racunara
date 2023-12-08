// Napisati sljedeci program u MIPS assembly-u.
// Generalno operacija promocije se radi po sljedecim pravilima (ukoliko su 
// tipovi operacije razliciti):
//     1. Provjeri da li je bilo koji od tipova u izrazu long double - ukoliko 
//        jeste, konvertuj drugi tip, šta god on bio u long double.
//     2. Ukoliko prethodna stavka nije zadovoljena, provjeri da li je bilo koji
//        od tipova u izrazu double - ukoliko jeste, konvertuj drugi tip, šta 
//        god on bio u double.
//     3. Ukoliko prethodne stavke nisu zadovoljene, provjeri da li je bilo koji
//        od tipova float - ukoliko jeste, konvertuj drugi tip, šta god on bio
//        u float.
//     4. Ukoliko prethodne stavke nisu zadovoljene odradi integer promociju.
//


#include <stdio.h>
double foo(float a, int b);
/*   if (a < b)
 return (double)a + b; */
/*   return (double)a - b; */
/* } */

int main(int argc, char *argv[]) {
  
  double s = foo(5.5, 16777220);
  double z = 5.5 + 16777220;
  printf("foo: %f\n", s);
  printf("double: %f\n", z);
  return 0;
}
