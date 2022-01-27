// Exercise 9
//
// author: Ravishankar Selvaraj (2036915)
//
// Circumference of an Ellipse - approximate the circumference of an entered ellipse

#define _USE_MATH_DEFINES
#include <iostream>
#include <cmath>
#include <iomanip>


using namespace std;

double length(double x1, double x2, double y1, double y2)
{
    return sqrt(pow((x1 - y1), 2) + pow((x2 - y2), 2));
}

void ellipse(double a, double b, double t, double& x, double& y)
{
    x = a * cos(t);
    y = b * sin(t);
}

double circumference(double a, double b, int n)
{
    double circumference = 0;

    // splitting the interval [0, 2*Pi] into n equal parts
    for (double i = 0; i < M_PI * 2; i += 2 * M_PI / n)
    {
        // first point on the ellipse
        double x, y;
        ellipse(a, b, i, x, y);
        // second point on the ellipse
        double u, w;
        ellipse(a, b, i + (2 * M_PI / n), u, w);
        circumference += length(x, y, u, w);
    }
    return circumference;
}

int main()
{
    double a, b, eps;
    cout << "Please enter the half axes a and b and the desired relative accuracy eps." << endl;
    cin >> a >> b >> eps;

    for (int n = 2; n <= pow(2, 24);)
    {
        double x = circumference(a, b, n);
        cout << "n = " << setw(8) << left << n << " circumference = " << x << endl;
        double y = circumference(a, b, n / 2);
        if (abs((x - y) / x) <= eps) break;
        n *= 2;
    }
}
