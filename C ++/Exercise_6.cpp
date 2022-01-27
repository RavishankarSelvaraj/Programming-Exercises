// Exercise 6
//
// author: Ravishankar Selvaraj (2036915)
//
// Pi - approximate pi using trapezoidal rule

#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    int n{ 0 }; // number of intervals
    double result; // result
    double sum; // compute the term f(x0)+2f(x1)+...+2f(x(n-1))+f(xn)
    sum = 4; // add first term f(x0)

    cout << "Please enter a number 'n' for the intervals." << endl;
    cin >> n;

    for (int i = 1; i < n; i++) {
        sum += double(8) / (1 + pow((double(i)/n), 2));
    }

    sum += double(4) / (1 + pow((double(n)/n), 2)); // add last term f(xn)

    result = sum / (double(2) * n); // (h/2)*f(x0)+2f(x1)+...+2f(x(n-1))+f(xn)

    cout << "Compute the integral by using the trapezoidal rule gives " << result << endl;

    return 0;
}


