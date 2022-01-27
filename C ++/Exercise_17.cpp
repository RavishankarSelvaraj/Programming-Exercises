// Exercise 17
// author: Ravishankar Selvaraj (2036915)
// Classes for Adresses and Persons

#include <iostream>

using namespace std;

class Adress
{
private:
    string street;
    string housenumber;
    string postcode;
    string city;
    string country;
public:
    Adress()
    {
        street = "dummystreet";
        housenumber = "dummyhousenumber";
        postcode = "dummypostcode";
        city = "dummycity";
        country = "dummycountry";
    }
    Adress(string s, string h, string p, string ci, string co)
    {
        street = s;
        housenumber = h;
        postcode = p;
        city = ci;
        country = co;
    }
    string getStreet() const { return street; }
    string getHousenumber() const { return housenumber; }
    string getPostcode() const { return postcode; }
    string getCity() const { return city; }
    string getCountry() const { return country; }

    void setAdress(string s, string h, string p, string ci, string co)
    {
        street = s;
        housenumber = h;
        postcode = p;
        city = ci;
        country = co;
    }

    void print() const { cout << "Adress: \n" << street << " " << housenumber << "\n" << postcode << " " << city << "\n" << country << " \n" << endl;  }
};

class Person
{
private:
    string givenname;
    string familyname;
    Adress adress;
public:
    Person(string g, string f, Adress a)
    {
        givenname = g;
        familyname = f;
        adress = a;
    }
    void move(Adress to)
    {
        string s, h, p, ci, co;
        s = to.getStreet();
        h = to.getHousenumber();
        p = to.getPostcode();
        ci = to.getCity();
        co = to.getCountry();
        adress.setAdress(s, h, p, ci, co);
    }

    void print() const 
    { 
        
        cout << "Name: \n" << givenname << " " << familyname << "\n" << endl; 
        adress.print();
        cout << "\n" << endl;
    }
};

int main()
{
    Adress b{ "Steinbeck", "83", "42119", "Wuppertal", "Germany" }; 
    b.print(); // print adress
    Person c{ "Ravishankar", "Selvaraj", b };
    c.print(); // print person
    Adress d{ "Max-Horkheimer STraße", "16", "42119", "Wuppertal", "Germany" };
    c.move(d); // person moves
    c.print(); // print person with new adress
}

