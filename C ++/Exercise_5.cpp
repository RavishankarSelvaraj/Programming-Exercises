// Exercise 5
//
// author: Ravishankar Selvaraj (2036915)
//
// Free Fall - calculate the distance and velocity of an entered time in free fall

#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    double t{ 0.0 }; // time in seonds
    double s{ 0.0 }; // distance in meters
    double v_1{ 0.0 }; // velocity in meters per second
    double v_2{ 0.0 }; // velocity in kilometers per hour
    bool stopper{ true }; // gets false if user enters a negative number
    
    while (stopper) {
        cout << "Please enter a certain amount of time (in sec)! (Enter negative number to stop)" << endl;
        cin >> t;

        if (t < 0) {
            cout << "You ended this program." << endl;
            stopper = false;
            break;
        }
           
        s = 0.5 * 9.81 * pow(t, 2);
        v_1 = 9.81 * t;
        v_2 = v_1 * 3.6;

        cout << "The distance after " << t << " seconds is " << s << " meters." << endl;
        cout << "The velocity is " << v_1 << " m/s or " << v_2 << " km/h." << endl;
        cout << endl;
        continue;
   }
 return 0;
}


