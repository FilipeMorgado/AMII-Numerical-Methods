Boas malta!

Peço vos que ao tentarem nao alterem os valores dos ficheiros .txt manualmente para conseguirem
testar o programa e tudo funcionar corretamente.
Caso queiram testar o programa, o ficheiro "pvi.txt" j· tem um PVI previamente introduzido.
   
   PVI: f(t,y) = y
        a = 0
        b = 2
        n = 10
        y0 = 1

Para implementarem a vossa interface para o metodo que esao a trabalhar tem de ir buscar os
valores de pvi ao ficheiro "pvi.txt", para isso devem usar o seguinte cÛdigo:

    % (1)
    fileID = fopen('pvi.txt');
    C = textscan(fileID,'%s%s%s%s%s');
    fclose(fileID);

    % (2)
    strF  = string(C{1});
    f  = @(t,y) eval(vectorize(strF));
    a  = str2num(string(C{2}));
    b  = str2num(string(C{3}));
    n  = str2num(string(C{4}));
    y0 = str2num(string(C{5}));

Basicamente isto esta a ir buscar informacao ao ficheiro com os dados do PVI (1), e
esta a guardar os dados formatados nas suas variaveis em (2)

Voces tem de desenvolver uma interface para cada metodo e se todos gostarem baseada na "interfaceRK2.m"
que eu fiz, isto por 2 motivos:

    -> Garantir a linearidade da aplicacao
    -> Terem menos trabalho e mais tempo para detalhes que realmente interessam

NOTA:
    NO INICIO DAS VOSSAS INTERFACES NAO PONHAM "clc" NEM "clear" ASSIM O UTILIZADOR VAI CONTINUAR A PODER
    VER OS VALORES DO PVI INTRODUZIDO NO CABE«ALHO DO MENU

Juntamente a interface deve ser desenvolvida uma funcao para o metodo numerico que estao a abordar, 
devidamente comentado.

Todas as funcoes e interfaces que vamos utilizar ja estao implementadas em "InterfaceMenu.m", que e o nosso 
ficheiro principal. Para testarem se tudo funciona tem duas opcoes:

    -> 1a opcao: Correr a interface que desenvolveram, isto vai usar o valor que esta
                 introduzido em "pvi.txt"

    -> 2a opcao: Correr o ficheiro "InterfaceMenu.m", que vai utilizar o PVI introduzido em "pvi.txt",
                 selecionam o metodo que estao a trabalhar e vao ser envidados para a interface que estao
                 a desenvolver.

Para poderem alterar o PVI, devem editar a interface "InterfaceMenu.m", ir para a linha 166 e passar o valor para de:
    
    fprintf(fileID, 'true\n'); 

para:

fprintf(fileID, 'false\n'); 

depois correm o programa, escolhem a opcao 0 e voltam a correr o programa. A partir deste momento, sempre que 
inicializarem a interface "InterfaceMenu.m" vai vos ser pedido para introduzir os paramentro de um PVI novo.
O processo de paragem desta entrada de dados e o inverso desta explicacao.

Para pararem a execuÁ„o do programa, nao utilizem: 
    alt + C      (Windows)
    control + C  (MAC)

Isto, dependendo do estagio de execucao do programa pode dar um erro, pois o texto do "controlador.txt", que e o 
verificador da entrada de dados, ou seja, verifica se e necessario pedir os valores do PVI, pode ficar em branco, o que 
faz com que o programa nao funcione.

NOTA:
    AGRADECO QUE NAO ORGANIZEM OS FICHEIROS EM PASTAS, PONHAM APENAS CADA COISA A FUNCIONAR CORRETAMENTE
    EU DEPOIS IREI TRATAR DISSO



Autor: Vasco Pereira .: a2019134744@isec.pt
Data:  27 de marco de 2020




