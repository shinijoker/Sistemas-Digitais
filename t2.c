#include <stdio.h>
#include <stdlib.h>

typedef struct{
	float x;
	float y;

} pontos;

float sinal (pontos point_a, pontos point_b, pontos point_c){
    int result=(point_a.x - point_c.x) * (point_b.y - point_c.y) - (point_b.x - point_c.x) * (point_a.y - point_c.y);
    return result;
}

int pontoNoTriangulo(pontos p, pontos a, pontos b, pontos c){
    int v1, v2, v3;

    v1 = sinal(p, a, b) < 0.0f;
    v2 = sinal(p, b, c) < 0.0f;
    v3 = sinal(p, c, a) < 0.0f;

    if(((v1 == v2) && (v2 == v3)))
    	return 1;

    else
    	return 0;
}

int main(){
    int escolha=1;
    while(escolha!=0){
        pontos a, b, c, p;
        printf("Digite o X do ponto A");
        scanf("%f", &a.x);
        printf("Digite o Y do ponto A");
        scanf("%f", &a.y);
        printf("Digite o X do ponto B");
        scanf("%f", &b.x);
        printf("Digite o Y do ponto B");
        scanf("%f", &b.y);
        printf("Digite o X do ponto C");
        scanf("%f", &c.x);
        printf("Digite o Y do ponto C");
        scanf("%f", &c.y);
        printf("Agora digite as coordernadas do ponto para fazer a verificação\n");
        printf("Digite o x do ponto para verificação");
        scanf("%f", &p.x);
        printf("Digite o y para verificação");
        scanf("%f", &p.y);

        if(pontoNoTriangulo(p, a, b, c)){
            printf("o Ponto está dentro do triângulo\n");
        }
        else{
            printf("o Ponto está fora do triângulo\n");
        }
        printf("Digite 0 se deseja sair ou qualquer outro número se deseja continuar: ");
        scanf("%d", &escolha);
    }

	return 0;
}
