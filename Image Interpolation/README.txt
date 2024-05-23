Buliga Theodor Ioan
313 CA

Interpolare aplicata pe imagini - Tema de casa nr. 2

Tema reprezinta un program in Octave, care urmareste sa aplice diverse
modificari asupra imaginilor, fie ele alb-negru, fie RGB, utilizand
interpolarile cerute, interpolarea bicubica si cea proximala.
Pentru realizarea temei am folosit functiile predefinite din schelet,
urmarind din aproape in aproape "TO DO - urile".

PROXIMAL:
	proximal_2x2
Se definesc punctele intermediare, apoi cele patru puncte incadratoare,
iar pe urma se aproximeaza valoarea pixelului din imaginea finala,
in functie de cea initiala.

	proximal_2x2_RGB
De data asta se extrag canalele pentru fiecare culoare, iar apoi
se aplica functia de mai sus pentru ficare canal. La final se concateneaza
matricele rezultate, rezultatul fiind imaginea RGB modificata.

	proximal_coef
Functia calculeaza coeficientii a pentru interpolare, conform formulei date.

	proximal_resize
Calculeaza facotrii de scalare, se parcurge ficare pixel, iar apoi se
calculeaza valoarea pixelului vecin prin rotunjire si utilizand noile date.
La final se va adauga pixelul in noua imagine.

	proximal_resize_RGB
La fel ca mai sus, se extrag canalele, iar apoi se aplica functia de
redimensionare pentru fiecare canal. In final se concateneaza matricele
rezultate si se obtine matricea(imaginea) redimensionata.

	proximal_rotate
Se calculeaza datele necesare, la fel ca mai sus, dar de data asta
apar sinusul si cosinusul unghiului de rotatie. Se parcurge, din nou,
fiecare pixel din imagine si se calculeaza in mare parte aceleasi date ca
ca mai sus. De data asta, se verifica daca pixelul este in exteriorul imaginii,
iar in cazul in care este, acesta va deveni negru. Daca pixelul este
in interior, se calculeaza punctele inconjuratoare, apoi coeficientii de
interpolare, iar in final se adauga valoarea interpolata a pixelului in
imaginea rezultata.

	proximal_rotate_RGB
Se extrag canalele, se aplica functia de rotatie pentru fiecare canal, iar
in cele din urma se concateneaza matricele rezultate, obtinandu-se matricea
cautata.

BICUBIC:
	bicubic_coef
Calculeaza coeficientii de interpolare bicubica pentru 4 puncte alaturate,
utilizand formula propusa si matricele intermediare.

	fx
Calculeaza derivata dx a pixelului dorit din matricea f, ce
are coordonatele x si y. In cazul in care pixelul este situat in margine,
valoarea derivatei va fi 0.

	fy
Calculeaza derivata dy, la fel ca mai sus.

	fxy
Calculeaza derivata dxy, dupa modelul fx sau fy.

	precalc_d
Precalculeaza cele 3 matrice: Ix, Iy si Ixy. Se folosesc derivatele de mai sus,
in timp ce se parcurge imaginea initiala, aplicandu-se functiile pentru a afla
valoarea derivata a pixelului.

	bicubic_resize
In mare parte se vor calcula aceleasi date ca la interpolarea proximala(
factorii de scalare, matricea de transformare, inversa ei), dar de data
asta se precalculeaza derivatele. Se parcurge fiecare pixel din imagine,
iar apoi se calculeaza valoarea interpolata a pixelului, urmand sa fie adaugat
in matricea rezultat. Punctele inconjuratoare precum si mare parte din restul
datelor necesare au fost calculate la fel ca mai sus, la interpolarea
proximala. Coeficientii vor fi calculati diferit, folosind interpolarea
bicubica.

	bicubic_resize_RGB
Algoritmul este asemenator cu toate celelalte functii RGB. Se extrag canalele,
se aplica functia de redimensionare, iar apoi se concateneaza matricele.
Rezultatul va fi matricea redimensionata.

Comentarii:
	Consider ca putea exista o implementare mai buna, cel putin la nivel de
utilizare de memorie. Am ales sa folosesc mai multe variabile auxiliare pentru
a ma orienta mai usor in cod si pentru a depana potentialele probleme mai usor.
Cu siguranta se putea realiza o modularizare mai buna, intrucat sunt constient
ca exista unele bucati de cod care se repeta.
	In urma acestei teme am invatat sa folosesc mult mai bine
interpolarile si am invatat si noi tipuri de interpolari. Ma simt mai stapan pe
codul pe care-l scriu si consider ca am avansat in ceea ce priveste programarea
in Octave. Totodata, am inteles si o parte prelucrarea imaginilor.

Feedback:
	A fost o tema foarte foarte bine organizata. Fiecare cerinta a fost
prezentata in amanunt, foarte clar, se intelegea foarte bine ce se cere. Mi-a
placut deosebit de mult scheletul pus la dispozitie, a fost unul dintre cele
mai bune oferite pana acum. A facut orientarea mult mai usoara, pot spune ca
a mai facut "lumina" printre cerintele mai dificile si per total a facut
munca mult mai usoara. Ca dificultate, tema a fost relativ dificila, intrucat
a fost nevoie sa intelegem cum functioneaza interpolarile respective, insa dupa
cum am spus, structura scheletului a facut atat munca, cat si depanarea
erorilor mult mai usor de abordat. Mi-a placut ca a avut un caracter practic
si a venit ca o completare a temei 3 de la PCLP(din semestrul trecut).
	In concluzie, a fost o tema super, din care am invatat foarte mult
si care mi-a testat cunostintele acumulate de-a lungul semestrului.

Bibliografie:
	-cursurile de MN
	-laboratoarele de MN
	-tutoriale: https://www.youtube.com/watch?v=ZVuRUXdIwDA
		    https://www.youtube.com/watch?v=poY_nGzEEWM
		    https://www.youtube.com/watch?v=dIlR8vS9T-c&t=238s




