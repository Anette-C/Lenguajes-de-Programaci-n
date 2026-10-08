#include <vector>
#include <iostream>

int maximo(const std::vector<int>& v);

int maximo(const std::vector<int>& v) {

if (v.empty()) {
    std::cout << "Error: El vector esta vacio." << std::endl;
    return 0; 
}
int max = v.at(0); //v.at(0) funciona igual que v[0], pero v.at(0) lanza una excepción si el índice está fuera de rango, mientras que v[0] no lo hace.
    for (size_t i = 1; i < v.size(); i++) {
        if (v.at(i) > max) {
            max = v.at(i);
        }
    
}
return max;
}

int main() {
    std::vector<int> v = {};
    std::cout << "El valor maximo es: " << maximo(v) << std::endl;
    return 0;
}
