#include <iostream>

using namespace std;
class Float {
public:
  Float operator +(Float &);
  float value;
};

Float Float::operator +(Float &f2)
{
  Float res;
  res.value = int(value + f2.value + 0.5);
  return res;
}

int main()
{
  Float a, b, c;
  a.value = 0.1;
  b.value = 0.5;
  c = a+b;
  cout << c.value << endl;
  return 0;
}
