#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <cstring>
#include <iostream>
#include <time.h>
#include <cstdlib>

int main()
{
	char wybur[10];
	char str2[] = "t";
	int i;
	char str3[] = "n";
	int p;
	int z;
	int w;
	int liczba[50];
	int n = 0;
	int k;
	int c;
	int e;
	int a;
	int b;
	int v;



	setlocale(LC_CTYPE, "Polish");



	for (i = 0; i < 120; i++) {
		printf("*");
	};

	printf("Autor Programu: Wojciech Hyl\n");

	for (i = 0; i < 120; i++) {
		printf("*");
		srand((unsigned int)time(NULL));
	};
	do {
		n++;
		c = 0;
		for (i = 0; i < 120; i++) {
			printf("*");
		};

		printf("Zadaj przedział losowanych licz\n");

		printf("Początek: ");

		scanf_s("%d", &p);

		printf("Zakończenie: ");

		scanf_s("%d", &z);

		do {

			printf("Ile licz wylosować ? ");

			scanf_s("%d", &w);

			if (w > 50) {
				printf("Za dużo liczb do wylosowania \n Podaj ilość w zakresie (0-50)\n ");

			}
			else {
				break;
			}

		} while (w > 50);

		a = w;
		v = w;
		c = 0;
		if (n % 2 == 0) {
			for (; w > 0; w--) {
				liczba[c] = rand() % (z - p + 1) + p;
				if (liczba[c] == 0) {
					printf("%d! ", liczba[c]);
					c++;
				}
				else
				{
					printf("%d ", liczba[c]);
					c++;
				}

			}
		}
		else {
			for (; w > 0; w--) {
				liczba[c] = rand() % (z - p + 1) + p;
				printf("%d ", liczba[c]);
				c++;
			}
		}

		printf("\nPodaj dowolną liczbę ");
		scanf_s("%d", &e);
		c = 0;
		b = 0;
		for (; a > 0; a--) {
			if (liczba[c] == e) {
				b++;
				
			}
			c++;
		}

		printf("\nPodana liczba wystąpiła %d razy", b);
		b = 0;
		c = 0;
		
			if (n % 2 != 0) {

				if (n < 51 && n <= v) {
					for (; v >= 0; v--) {
						if (liczba[c] == liczba[n]) {
							b++;

						}
						c++;
					}

					printf("\n==>Uwaga nieparzysty przebieg programu (%d) - aktywuję się specjalna funkcja !\n ", n);


					printf("Liczba która wypadła w losowaniu jako %d wystopiła %d razy !!!", n, b);
				}
				else
				{
					if (n > 50) {
						printf("\nPrzekroczono tablice");
					}
					else
					{
						if (n > v) {
							printf("\nZa mało wylosowanych licz");
						}
					}
				}
			}
		
			
		


			printf("\nCzy wykonać program ponownie (t/n) : ");

			do {


				scanf_s("%9s", wybur, (unsigned)_countof(wybur));

				if (strcmp(wybur, str2) == 0 || (strcmp(wybur, str3) == 0))
				{
					k = 1;
				}
				else
				{
					k = 0;
				}



			} while (k == 0);



		} while ((strcmp(wybur, str2) == 0));









		system("PAUSE");

		return 0;
	}
