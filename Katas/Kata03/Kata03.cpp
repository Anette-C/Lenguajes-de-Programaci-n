#include <vector>
#include <iostream>

int maximo(const std::vector<int>& v);

int maximo(const std::vector<int>& v) {
int max = v[0];
for (size_t i = 1; i < v.size(); i++) {
    if (v[i] > max) {
        max = v[i];
    } 
}
return max;
}

main() {
    std::vector<int> v = {3, 1, 4, 1, 5, 9, 2, 6, 5};
    int max_value = maximo(v);
    std::cout << "El valor máximo es: " << max_value << std::endl;
    return 0;
}
