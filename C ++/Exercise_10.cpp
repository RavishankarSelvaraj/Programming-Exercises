// Exercise 10
//
// author: Ravishankar Selvaraj (2036915)
//
// Magic squares - generate a magic square for an entered odd number between 3 and 31

#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

void printSquare(int m[][31], int n) 
{
    for (int i{ 0 }; i < n; i++)
    {
        for (int j{ 0 }; j < n; j++)
        {
            cout << setw(3) << m[i][j];
        }
        cout << endl;
    }
}

void generateMagicSquare(int m[][31], int n) 
{
    int i = ceil(n / 2.0);
    int j = ceil(n / 2.0) - 1; 
    m[i][j] = 1; // number 1 is entered into the field below the centre

    for (int number{ 2 }; number <= n * n; number++)
    {
        // try to enter the next number in ascending order
        i++; j++;
        if (i == n) i = 0; // end of rows -> first row
        if (j == n) j = 0; // end of columns -> first column
        if (m[i][j] != 0) // if the next position is already used we must move down 2 rows 
        {
            if (i == 0 && j == 0) // reached bottom right 
            {
                i = n;
                j = n;
            }
            i--; j--;
            i = i + 2;
            if (i == n)
            {
                i = 0;
            }
            if (i == n + 1)
            {
                i = 1;
            }

            m[i][j] = number;
        }
        else if (m[i][j] == 0)
        {
            m[i][j] = number;
        }
    }
}

int main()
{
    int ms[31][31]{};
    int n{};
    cout << "Please enter any odd n with 3 <= n <= 31. " << endl;
    cin >> n;
    generateMagicSquare(ms, n);
    cout << endl;
    printSquare(ms, n);
}

