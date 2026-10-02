#include <iostream>
#include <cstdint>

//Factorial recursivo
uint64_t factorial_rec(int n){
    if(n == 0){
        return 1;
    }
    return n * factorial_rec(n - 1);
}

//Factorial iterativo
uint64_t factorial_ciclo(int n){
    uint64_t resultado = 1;
    for(int i = 2; i <= n; i++){
        resultado *= i;
    }
    return resultado;
}