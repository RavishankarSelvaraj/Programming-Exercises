// Exercise 8
//
// author: Ravishankar Selvaraj (2036915)
//
// Prime Factor

#include <iostream>
#include <string>

using namespace std;

int main()
{
    cout << "Enter an integer number to find its prime factorization." << endl;
    int n{ 0 }; // find prime factorization for this number 
    cin >> n;
    string result = "Prime Factorization is: "; // output with the prime factorization of n

    int f = 2; // First possible factor

    // while n has remaining factors
    while (n > 1)
    {
        // If f devides n add it to the prime factorization
        if (n % f == 0)
        {
            string add = to_string(f);
            result += add+"*";
            n /= f;
        }
        else
        {
            f += 1;
        }
    }
    cout << result;
    return 0;
}
