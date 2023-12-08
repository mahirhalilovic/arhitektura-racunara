#include <stdio.h>
#include <string.h>
/*  Napisati rekurzivnu funkciju u MIPS assemblyu  */
/* koja provjerava da li je proslijedjeni string palindrom.  */
/* Implementacija funkcije u C-u je data ispod: */

int isPalindrome(char* s, int len);
// {
//    if(len < 2) 
//      return 1; 
//    else
//      return s[0] == s[len - 1] && isPalindrome(s + 1, len - 2); 
//  } 

int main(int argc, char *argv[]) {
  char niz[50] = "anavolimilovaaaana";
  if (isPalindrome(niz, strlen(niz))) {
    printf("Palindrom!\n");
  } else {
    printf("Nije palindrom\n");
  }
  return 0;
}
