#include<stdlib.h>
#include<stdio.h>

typedef struct{
	int x,y;
}Triangulo;

int main(){
	Triangulo t1,t2,t3,p;
	int i,vl,to1,to2,to3;
	FILE *VT;
	FILE *VP;
	FILE *Grava;
	VT=fopen("Triangulo.txt","r");  //coordenadas
	VP=fopen("Ponto.txt","r"); //  Ponto
	Grava=fopen("Result.txt","w"); // Grava o resultado dos arquivos
	for(i=0;i<10;i++){
		fscanf(VT,"%i %i",&t1.x,&t1.y);// Leitura das Coordenadas
		fscanf(VT,"%i %i",&t2.x,&t2.y);// Leitura das Coordenadas
		fscanf(VT,"%i %i",&t3.x,&t3.y);// Leitura das Coordenadas
		fscanf(VP,"%i %i",&p.x,&p.y);  // Leitura do Ponto
		vl = calc(t1,t2,t3);
		to1 = calc(p,t2,t3);
		to2 = calc(t1,p,t3);
		to3 = calc(t1,t2,p);
		if(vl==to1+to2+to3){
			printf("Coordenada dentro do triangulo\n");
			fprintf(Grava,"1\n");
		}else{
			printf("Coordenada fora do triangulo\n");
			fprintf(Grava,"0\n");
		}
	}
	system("pause");
	return(0);
}


calc(Triangulo ponto1,Triangulo ponto2,Triangulo ponto3){
	int valor;
	valor = abs(ponto1.x*(ponto2.y-ponto3.y) + ponto2.x*(ponto3.y-ponto1.y)+ ponto3.x*(ponto1.y-ponto2.y)); // Faz calculo do triangulo
	return(valor);
}
