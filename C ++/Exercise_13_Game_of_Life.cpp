// Exercise 13
//
// author: Ravishankar Selvaraj (2036915)
//
// Game of Life

#include <iostream>
#include <random>
#include <chrono>
#include <thread>

using namespace std;

void print(bool m[][30])
{
    for (int i{ 0 }; i < 20; i++)
    {
        for (int j{ 0 }; j < 30; j++)
        {
            if (m[i][j] == false) 
            {
                cout << "\033[0;41m  \033[0m";
            }
            else
            {
                cout << "\033[0;47m  \033[0m";
            }
        }
        cout << endl;
    }
    cout << "\n";
}

// count neighbours in a toroidal way i.e. stitching left and right and top and bottom together
int countNeighbours(bool m[][30], int x, int y)
{
    int c{ 0 };
    if ((x == 0) && (y == 0)) // left top corner
    {
        if (m[19][29]) c++;
        if (m[19][0]) c++;
        if (m[19][1]) c++;
        if (m[0][1]) c++;
        if (m[1][1]) c++;
        if (m[1][0]) c++;
        if (m[1][29]) c++;
        if (m[0][29]) c++;
        return c;
    }
    if ((x == 19) && (y == 29)) // right bottom corner
    {
        if (m[18][28]) c++;
        if (m[18][29]) c++;
        if (m[18][0]) c++;
        if (m[19][0]) c++;
        if (m[0][0]) c++;
        if (m[0][29]) c++;
        if (m[0][28]) c++;
        if (m[19][28]) c++;
        return c;
    }
    if ((x == 0) && (y == 29)) // right top corner
    {
        if (m[19][28]) c++;
        if (m[19][29]) c++;
        if (m[19][0]) c++;
        if (m[0][0]) c++;
        if (m[1][0]) c++;
        if (m[1][29]) c++;
        if (m[1][28]) c++;
        if (m[0][28]) c++;
        return c;
    }
    if ((x == 19) && (y == 0)) // left bottom corner
    {
        if (m[18][29]) c++;
        if (m[18][0]) c++;
        if (m[18][1]) c++;
        if (m[19][1]) c++;
        if (m[0][1]) c++;
        if (m[0][0]) c++;
        if (m[0][29]) c++;
        if (m[19][29]) c++;
        return c;
    }
    if (x == 0) // top row
    {
        if (m[19][y - 1]) c++;
        if (m[19][y]) c++;
        if (m[19][y + 1]) c++;
        if (m[0][y + 1]) c++;
        if (m[1][y + 1]) c++;
        if (m[1][y]) c++;
        if (m[1][y - 1]) c++;
        if (m[0][y - 1]) c++;
        return c;
    }
    if (y == 0) // left column
    {
        if (m[x - 1][29]) c++;
        if (m[x - 1][0]) c++;
        if (m[x - 1][0]) c++;
        if (m[x][1]) c++;
        if (m[x + 1][1]) c++;
        if (m[x + 1][0]) c++;
        if (m[x + 1][29]) c++;
        if (m[x][29]) c++;
        return c;
    }
    if (y == 29) // right column
    {
        if (m[x - 1][28]) c++;
        if (m[x - 1][29]) c++;
        if (m[x - 1][0]) c++;
        if (m[x][0]) c++;
        if (m[x + 1][0]) c++;
        if (m[x + 1][29]) c++;
        if (m[x + 1][28]) c++;
        if (m[x][28]) c++;
        return c;
    }
    if (x == 19) // bottom row
    {
        if (m[18][y - 1]) c++;
        if (m[18][y]) c++;
        if (m[18][y + 1]) c++;
        if (m[19][y + 1]) c++;
        if (m[0][y + 1]) c++;
        if (m[0][y]) c++;
        if (m[0][y - 1]) c++;
        if (m[19][y - 1]) c++;
        return c;
    }
    else // everywhere else in the field
    {
        if (m[x - 1][y - 1]) c++;
        if (m[x - 1][y]) c++;
        if (m[x - 1][y + 1]) c++;
        if (m[x][y + 1]) c++;
        if (m[x + 1][y + 1]) c++;
        if (m[x + 1][y]) c++;
        if (m[x + 1][y - 1]) c++;
        if (m[x][y - 1]) c++;
        return c;
    }
}

void nextgen(bool m[][30])
{
    // copy the field
    bool oldgen[20][30];
    for (int i{ 0 }; i < 20; i++)
    {
        for (int j{ 0 }; j < 30; j++)
        {
            oldgen[i][j] = m[i][j];
        }
    }
    // apply transition to next generation
    for (int i{ 0 }; i < 20; i++)
    {
        for (int j{ 0 }; j < 30; j++)
        {
            if (oldgen[i][j] == true && countNeighbours(oldgen, i, j) < 2) // underpopulation
            {
                m[i][j] = false;
            }
            if (oldgen[i][j] == true && countNeighbours(oldgen, i, j) <= 3 && countNeighbours(oldgen, i, j) >= 2) // live to next generation
            {
                m[i][j] = true;
            }
            if (oldgen[i][j] == true && countNeighbours(oldgen, i, j) > 3) // overpopulation
            {
                m[i][j] = false;
            }
            if (oldgen[i][j] == false && countNeighbours(oldgen, i, j) == 3) // reproduction
            {
                m[i][j] = true;
            }
        }
    }
}

int main()
{
    // create the first generation where the probability for a live cell is 20%
    bool firstGen[20][30]{};
    default_random_engine generator;
    uniform_int_distribution<int> distribution(1, 100); 
    for (int i{ 0 }; i < 20; i++)
    {
        for (int j{ 0 }; j < 30; j++)
        {
            int tmp = distribution(generator);
            if (tmp <= 20)
            {
                firstGen[i][j] = true;
            }
            else
            {
                firstGen[i][j] = false;
            }
        }
    }

    // perform 50 iterations
    for (int i{ 0 }; i <= 50; i++)
    {
        cout << i << ". generation" << endl;
        print(firstGen);
        nextgen(firstGen);
        this_thread::sleep_for(1s);
    }
}

