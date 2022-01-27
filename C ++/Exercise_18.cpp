// class date, this-pointer
// author:  Holger Arndt, Ravishankar Selvaraj (2036915)
// version: 28.08.2019

#include <iostream>
#include <cmath>

using namespace std;

class Date
{
private:
    int day;
    int month;
    int year;
    static inline const int daysPerMonth[]{ 31, 28, 31, 30, 31, 30, 31, 31, 30,
        31, 30, 31 };
    static const int stdYear{ 1970 };
    static bool isLeapYear(int year)
    {
        return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    }
    void checkDate();
public:
    Date()
    {
        day = month = 1;
        year = stdYear;
    }
    Date(int d, int m, int y)
    {
        day = d;
        month = m;
        year = y;
        checkDate();
    }
    int getDay() const { return day; }
    int getMonth() const { return month; }
    int getYear() const { return year; }
    void setDate(int d, int m, int y)
    {
        day = d;
        month = m;
        year = y;
        checkDate();
    }
    Date& incDay();
    Date& decDay();
    string dayOfTheWeek();
    void print() const { cout << day << '.' << month << '.' << year << endl; }
};

void Date::checkDate()
{
    if (year < 1 || month < 1 || month > 12 || day < 1
        || (day > daysPerMonth[month - 1]
            && !(day == 29 && month == 2 && isLeapYear(year))))
    {
        day = month = 1;
        year = stdYear;
    }
}

Date& Date::incDay()
{
    ++day;
    if (day > daysPerMonth[month - 1]
        && !(day == 29 && month == 2 && isLeapYear(year)))
    {
        day = 1;
        if (++month == 13)
        {
            month = 1;
            ++year;
        }
    }
    return *this;
}

Date& Date::decDay()
{
    --day;
    if (day < 1)
    {
        if (--month < 1)
        {
            month = 12;
            day = 31;
            --year;
        }
        if (month == 2 && isLeapYear(year))
        {
            day = 29;
        }
        else
        {
            day = daysPerMonth[month - 1];
        }
    }
    return *this;
}

string Date::dayOfTheWeek()
{
    int m[]{ 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    int y1 = year;
    if (month == 1 || month == 2)
    {
        y1--;
    }
    int y = y1 % 100;
    int c = floor(y1 / 100);
    int w = int(day + floor(2.6 * m[month - 1] - 0.2) + y + floor(y / 4.0) + floor(c / 4.0) + 5.0 * c) % 7;
    if (w == 0) { return "Sunday"; };
    if (w == 1) { return "Monday"; };
    if (w == 2) { return "Tuesday"; };
    if (w == 3) { return "Wednesday"; };
    if (w == 4) { return "Thursday"; };
    if (w == 5) { return "Friday"; };
    if (w == 6) { return "Saturday"; };

}

int main()
{
    Date d{ 23, 11, 1992 };
    d.decDay();
    d.print();   // 2.6.2017
    cout << d.dayOfTheWeek();
}