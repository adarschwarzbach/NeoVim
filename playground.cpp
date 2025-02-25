#include <iostream>

class TestClass {
public:
  int testNum;
  std::string className;
};

int main() {
  TestClass exploreObject;
  exploreObject.className = "tester";
  exploreObject.testNum = 1;
  std::cout << exploreObject.testNum << "\n";
  return 0;
}
