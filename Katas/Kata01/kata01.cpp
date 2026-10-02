#include <iostream>
#include <vector>

using namespace std;

std::vector<int> cuenta_atras(int n);

// 2. La función que imprime
void imprimir(const std::vector<int>& v) {
    std::cout << "(";
    for (size_t i = 0; i < v.size(); i++) {
        if (i > 0) std::cout << " ";
        std::cout << v[i];
    }
    std::cout << ")\n";
}

//forma iterativa
/*std::vector<int> cuenta_atras(int n) {
    std::vector<int> resultado; 
    for (int i = n; i > 0; i--) {
        resultado.push_back(i); 
    }
    return resultado; 
}
/**/

//forma recursiva
std::vector<int> cuenta_atras(int n) {
    if (n == 0) {
        return std::vector<int>(); // Retorna un vector vacío
    } else {
        std::vector<int> resultado = cuenta_atras(n - 1); // Llamada recursiva
        resultado.insert(resultado.begin(), n); // Inserta n al inicio del vector
        return resultado; // Retorna el vector resultante
    }
}
int main() {
    std::vector<int> v = cuenta_atras(5);
    imprimir(v);
    return 0;
}

/**/