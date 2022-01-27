// Exercise 12
//
// author: Ravishankar Selvaraj (2036915)
//
// Random Vector and Average

#include <iostream>
#include <random>

using namespace std;

int main()
{
    int n, m; // n = size of array, m = random numbers between 1 and m
    int sum{ 0 }; // sum for calculation of average
    // random generator
    default_random_engine generator;

    cout << "Please enter natural numbers n and m.\n";
    cin >> n >> m;

    // uniform distribution between 1 and m
    uniform_int_distribution<int> distribution(1, m);

    // create array of size n and initialize with random numbers
    int* v{};
    v = new int[n];
    for (int i{ 0 }; i < n; i++) {
        v[i] = distribution(generator);
    }

    // print first ten elements
    for (int i{ 0 }; i < n; i++)
    {
        if (i > 9) break;
        cout << v[i] << " ";
    }

    // compute sum
    for (int i{ 0 }; i < n; i++) {
        sum += v[i];
    }

    // print average
    cout << endl;
    cout << "The average is " << double(sum) / n << "!";
}

