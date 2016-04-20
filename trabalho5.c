#include<stdlib.h>
#include<stdio.h>

int main(){
    int a,entradac,entradav;
    FILE *LeituraC,*LeituraV,*Resultado;
    
    LeituraC = fopen("ResultadosC.txt","r");
    LeituraV = fopen("ResultadosV.txt","r");
    Resultado = fopen("Comparacao.txt","a");
    for(a=0;a<200;a++){
        fscanf(LeituraC,"%i",&entradac);
        fscanf(LeituraC,"%i",&entradav);
        if(entradac == entradav){
            fprintf(Resultado,"%i\n",a);
        }
    }
    return(0);
}
