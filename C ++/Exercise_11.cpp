// Exercise 11
//
// author: Ravishankar Selvaraj (2036915)
//
// Histogram Plotter

#include <iostream>
#include <iomanip>
#include <algorithm> // for m = *max_element(counter, counter + 20);
#include <cmath>
using namespace std;

int main()
{
    cout << "Please enter integer numbers between 0 and 20" << endl;
    int number; // entered number between 0 and 20
    int counter[21]{ }; // stores the number of occurence for each number
    int asteriks[21]{ }; // stores the number of asteriks for each number
    int max{ }; // max number of occurence

    while (cin >> number)
    {
        // count the occurency of each number
        if (number == 0) counter[0] +=1;
        if (number == 1) counter[1] += 1;
        if (number == 2) counter[2] += 1;
        if (number == 3) counter[3] += 1;
        if (number == 4) counter[4] += 1;
        if (number == 5) counter[5] += 1;
        if (number == 6) counter[6] += 1;
        if (number == 7) counter[7] += 1;
        if (number == 8) counter[8] += 1;
        if (number == 9) counter[9] += 1;
        if (number == 10) counter[10] += 1;
        if (number == 11) counter[11] += 1;
        if (number == 12) counter[12] += 1;
        if (number == 13) counter[13] += 1;
        if (number == 14) counter[14] += 1;
        if (number == 15) counter[15] += 1;
        if (number == 16) counter[16] += 1;
        if (number == 17) counter[17] += 1;
        if (number == 18) counter[18] += 1;
        if (number == 19) counter[19] += 1;
        if (number == 20) counter[20] += 1;
    }

    // find the appropriate length of the horizontal bar
    max = *max_element(counter, counter + 20);
    for (int i{ 0 }; i < 21; i++)
    {
        if (counter[i] == 0) // if the number didnt occur once, the bar gets 0 asteriks
        {
            asteriks[i] = 0;
            continue;
        }
        int numberOfAsterix{ 0 };
        double noa = counter[i] / double(max) * 60; // calculates the actual number of asterix with rule of three
        numberOfAsterix = ceil(noa); // only use intiger numbers
        asteriks[i] = numberOfAsterix;
    }

    // output
    for (int i{ 0 }; i < 21; i++)
    {
        cout << setw(2) << i << ": " << setw(7) << counter[i] << "  " << string(asteriks[i], '*') << endl;
    }
}

