// Exercise 7
//
// author: Ravishankar Selvaraj (2036915)
//
// Area of Geometric Shapes

#define _USE_MATH_DEFINES
#include <iostream>
#include <cmath>

using namespace std;

// method to display the menu
void showPossibleActions()
{
    cout << "choose type:" << endl;
    cout << "  (r) rectangle" << endl;
    cout << "  (e) ellipse" << endl;
    cout << "  (t) triangle" << endl;
    cout << "  (x) exit" << endl;

}

// mehtod for computing the area of a ractangle 
void rectangle(double a, double b)
{
    double area = a * b;
    cout << "area: " << area << endl;
}

// method for computing the area of an ellipse
void ellipse(double a, double b)
{
    double area = M_PI * a * b;
    cout << "area: " << area << endl;
}

// method for computing the area of a triangle
void triangle(double a, double b, double c)
{
    double s = (a + b + c) / 2;
    double area = sqrt(s * (s - a) * (s - b) * (s - c));
    cout << "area: " << area << endl;
}

int main()
{
    char input{ ' ' }; // gets value by user. Can be r, e, t, x
    bool exit = true; // gets false if the user wants to exit the program
    showPossibleActions();
    
    // is true as long user enters 'x'
    while(exit) {

        // user enters a value 
        cin >> input;

        // user wants to compute the area of a rectangle 
        if (input == 'r')
        {
            double a, b;
            cout << "side lengths a, b: ";
            cin >> a >> b;
            rectangle(a, b);
            showPossibleActions();
        }

        if (input == 'e')
        {
            double a, b;
            cout << "half axes a, b: ";
            cin >> a >> b;
            ellipse(a, b);
            showPossibleActions();
        }

        if (input == 't')
        {
            double a, b, c;
            cout << "side lengths a, b, c: ";
            cin >> a >> b >> c;
            triangle(a, b, c);
            showPossibleActions();
        }

        if (input == 'x')
        {
            exit = false;
        }
    }
    return 0;
}
