Buliga Theodor Ioan
313 CA

Tema de casa 1 - In spatele unui... Motor de cautare

Programul isi propune sa implementeze algoritmul PageRank, 
utilizat de motorul de cautare google in doua variante:
iterativ si algebric.

Pentru a putea implementa algoritmul in cele doua variante
a fost nevoie sa creez matricea de adiacenta
a unui graf (ce reprezinta hiperlegaturile dintre pagini).
Am creat matricea(initial o matrice de 0-uri), iar apoi
in functie de numarul de noduri si nodurile primite am 
schimbat in 1 elementele matricei de pe pozitiile corespunzatoare.
Am retinut numarul nodului pentru care voi pune 1, apoi am
primit pe rand vecinii sai, iar pentru elementul aflat pe 
pozitia A(nr. nod, nr. nod vecin) am pus 1.

In cazul in care nodul a fost vecin cu el insusi, am facut
elementul de la pozitia respectiva, A(nr. nod, nr. nod), 0.

Totodata, am pastrat si un vector in care am retinut numarul de vecini,
pentru a initializa mai usor matricea K(matricea ce va avea nr vecinilor
pe diagonala).

Iterative:
In continuare, pentru algoritmul Iterative, am calculat matricea M,
dupa formula M :=  (K^(-1) A)^T, conform documentatiei de pe Wikipedia.
Am initializat vectorul PageRank R(t) si R(t+1), dupa formula
R(t+1) = d * M * R(t) + (1-d) / N. Am folosit conditia de oprire pentru a stii
cat timp trebuie calculat noul R, |R(t+1) - R(t)| < epsilon(toleranta "eps"),
iar apoi l-am calculat efectiv pe R, conform formulei 
PR(p_i;t+1) = (1-d) / N + d * sum_(p_j in M(p_i)) [(PR (p_j; t) / L(p_j)].
R se va reinitializa cu noua valoare calculata la fiecare iteratie.

Algebraic:
La algorimtul Algebraic am folosit aceeasi initializare ca mai sus.
Pentru a gasi Q si R am aplicat algoritmul Gram-Schmidt,
prezentat la laborator (pentru I - d * M), iar apoi am rezolvat sistemul
utilizand alt algoritm prezentat la laborator, SST.

Gradul de apartenenta:
Am verificat in ce interval se afla "x" - ul functiei, iar apoi
am dat functiei valorile corespunzatoare. Pentru cazurile in care
functia lua valorile 1 respectiv 0, rezolvarea a fost triviala, insa
pentru cazul in care "x" se afla intre cele 2 valori mentionate, am
calculat valorile "a" si "b" pentru ca functia u(x) sa fie continua.

PageRank - afisarea:
Am folosit aceeasi citire si intializare ca la cei doi algoritmi de mai
sus(Iterative si Algebraic), insa de data aceasta am citit si celelalte
doua valori(folosite pentru a gasi gradul de apartenenta). Am generat
numele fisierului in care vor fi salvate datele de iesire si am inceput
afisarea prorpiu-zisa in fisier. Am afisat numarul de noduri, cu o linie
noua dupa, apoi am folosit algoritmul Iterative pentru a genera primul
vector, dupa care l-am afisat. In continuare, am urmat aceeasi pasi si
pentru algoritmul Algebraic(am generat vectorul folosind functia creata,
iar apoi l-am afisat). Apoi am sortat vectorul R2 descrescator si
l-am salvat pentru a il afisa. Am afisat apoi pentru fiecare element:
indicii din noul vector, numarul paginii inainte de sortare
si gradul de apartenenta

Comentarii:
Cred ca puteam realiza o implementare mai buna, cel putin la nivel
de modularizare. Partea de initializare a matricei de adiacenta si calculul
matricelor M si K puteau fi grupate intr-o singura functie, care sa fie
mai apoi apelata unde este nevoie. Totodata, sunt constient ca s-ar putea
sa nu fie eficient in totalitate si ca exista mereu loc de mai bine.

Am invatat sa folosesc mult mai bine Octave, m-am familiarizat cu
majoritatea functiilor puse la dispozitie, am inteles mai bine algoritmii
prezentati in laboratoare si ma simt mult mai pregatit la Metode Numerice.
Mi-a placut mult tema. Mi s-a parut foarte bine structurata, explicata
in detaliu si cu exemple care m-au ajutat sa inteleg mult mai bine ce
trebuie sa fac.

Resurse si bibliografie:
-cursurile de Metode Numerice
-laboratoarele de Metode Numerice
-http://en.wikipedia.org/wiki/PageRank
-https://octave.org/doc/v4.2.1/Simple-File-I_002fO.html
-totodata, am folosit implementarea algoritmilor Gram-Schmidt si SST in
 Octave prezentate la laborator de Mocanu Bogdan-Costel

