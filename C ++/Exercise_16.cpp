// Exercise 16
// author: Ravishankar Selvaraj (2036915)
// Class for Glasses

#include <iostream>

using namespace std;

class Glass 
{
private:
    unsigned int volume;
    unsigned int content;
public:
    Glass(unsigned int v, unsigned int c)
    {
        v = 100;
        c = 0;
        volume = v;
        content = c;
    }
    unsigned int getVolume() const { return volume; }
    unsigned int getContent() const { return content; }
    void fillIn(unsigned int fi)
    {
        int newContent = content + fi;
        if (newContent > 100) newContent = 100;
        content = newContent;
    }
    unsigned int drink(unsigned int dr)
    {
        if (dr > content)
        {
            unsigned int amount = content;
            content = 0;
            return amount;
        }
        content = content - dr;
        return dr;
    }
    void print() const { cout << "Volume: " << volume << ". Content: " << content << endl; }
};

int main()
{
    Glass d{100, 0};
    cout << "Volume: " << d.getVolume() << ". Content: " << d.getContent() << endl;
    d.fillIn(56);
    d.print();
    int a = d.drink(44);
    d.print();
    cout << "The drunken amount: " << a << endl;
    d.fillIn(150);
    d.print();
    d.drink(140);
    d.print();
}

