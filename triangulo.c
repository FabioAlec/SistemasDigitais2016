 #include <iostream>
 #include <string> 
 #include <cmath> // abs()
 
 using namespace std;
 
 typedef struct ponto{
 	int x, y;
 } ponto;
 
 typedef struct triangulo{
 	ponto a;
 	ponto b;
 	ponto c;
 } triangulo;
 
 int sign(ponto a, ponto b, ponto c);
 int isInTriangle(ponto p, triangulo t);
 
-// TODO : Testar se ponto está ou não no triângulo
-
 int main() {
 	ponto p;
 	triangulo tri;
 
 	string sair;
 	do{
 		cout << "Novo Triangulo\n";
 
 		cout << "\tPosicao da Vertice A(x,y):\n";
 		cout << "\t\tx:";
 		cin >> tri.a.x;
 		cout << "\t\ty:";
 		cin >> tri.a.y;
 
 		cout << "\tPosicao da Vertice B(x,y):\n";
 		cout << "\t\tx:";
 		cin >> tri.b.x;
 		cout << "\t\ty:";
 		cin >> tri.b.y;
 
 		cout << "\tPosicao da Vertice C(x,y):\n";
 		cout << "\t\tx:";
 		cin >> tri.c.x;
 		cout << "\t\ty:";
 		cin >> tri.c.y;
 
 		cout << "\n\tPonto a ser encontrado(x,y):\n";
 		cout << "\t\tx:";
 		cin >> p.x;
 		cout << "\t\ty:";
 		cin >> p.y;
 
 		isInTriangle(p, tri) ? cout << "\tDentro do triangulo!\n" : cout << "\tFora do triangulo!\n";
 
 		cout << "Construir novo triangulo? (y,n): ";
 		cin.ignore();
 		getline(cin,sair);
 	} while(sair != "n");
 
 	return 0;
 }
 
 int sign(ponto a, ponto b, ponto c) {
 	return abs( (a.x - c.x) * (b.y - c.y) - (b.x - c.x) * (a.y - c.y) );
 }
 
 int isInTriangle(ponto p, triangulo t) {
 	bool b1, b2, b3;
 
 	b1 = sign(p, t.a, t.b);
 	b2 = sign(p, t.b, t.c);
 	b3 = sign(p, t.c, t.a);
 
 	return ( (b1 == b2) && (b2 == b3) );
 }
