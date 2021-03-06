﻿# TD Diagramme de Bode
﻿
## Enoncé de TD
Soit le circuit RC suivant :

 1. Calculer la fonction de transfert $H(j\omega)$. 
 2. Calculer la pulsation de coupure $\omega_c$ ainsi que la fréquence de coupure $f_c$. 
 3. Calculer l'expression du module et de la phase de la fonction de transfert $H(j\omega)$.
 4. Déterminer le type de filtre réalisé.
 5. Tracer l'allure théorique du diagramme de Bode. 
 6. Simuler avec LTSpice le circuit RC et tracer son diagramme de Bode.

## Corrigé

### Calcul de la fonction de transfert
$$
\begin{aligned}
H(j \omega ) &= \frac{v_s}{v_e}=\frac{1/jc\omega}{R+1/jC\omega}\\
&= \frac{1}{1+jRC\omega}
\end{aligned}
$$
### Calcul de la pulsation de coupure $\omega_c$ ainsi que la fréquence de coupure $f_c$
$$
\omega_c = \frac{1}{RC} ~ \textrm{ et donc, } f_c = \frac{1}{2 \pi RC}
$$
### Calcul de l'expression du module et de la phase de la fonction de transfert $H(j\omega)$
$$
\begin{aligned}
|H(j\omega)| &= \frac{1}{\sqrt{1+(RC\omega)^2}}\\
\phi(j\omega)& = Arg(1) - Arg(1+jRC\omega) \\
&= 0 - Arctan(RC\omega /1) \\
&= - Arctan(RC\omega) \\
\end{aligned} 
$$
**Remarque** : A la fréquence de coupure $f_c$, le gain vaut $|H(j\omega_c)|=1/\sqrt(2)$ et la phase $\phi(\omega_c)=-\pi/4$.

### Déterminer le type de filtre réalisé
$$
\begin{aligned}
\lim_{ \omega \to 0} |H(j\omega)| &= 1 ~ \textrm{ , laisse passer les BF}\\
\lim_{ \omega \to +\infty} |H(j\omega)&|= 0 ~ \textrm{, supprime les HF} \\
\end{aligned}
$$
Il s'agit donc d'un filtre **passe-bas**.

### Tracer l'allure théorique du diagramme de Bode
Le tracé du module est constitué de deux asymptotes :
* une asymptote horizontale de $0$ jusque $f_c$
* une asymptote de pente $-20dB/décade$ de $f_c$ jusqu'à l'infini.

![enter image description here](https://github.com/sl4iut3/Documents/raw/master/M1104/bodeRC.png)
La courbe réelle se confond avec les asymptotes pour des faibles valeurs et des fortes valeurs de fréquence et se situe légèrement en dessous de l'asymptote aux alentours de la fréquence de coupure (voir la simulation dans le paragraphe suivant)

### Simulation LTSpice et tracé du diagramme de Bode

Le schéma se réalise de la manière classique :
* une résistance (CTRL+R pour tourner la résistance à l'horizontale)
* un condensateur
* un générateur de tension (dans *Library*, choisir un *Voltage*).

On peut positionner la valeur de **R** à $1k\Omega$ et **C** à $1\mu F$. Ceci nous conduit à une fréquence de coupure $f_c$ égale environ à $159Hz$.
Le générateur est réglé à une valeur **AC Amplitude** égale à 1 comme montré ci-dessous :
![enter image description here](https://github.com/sl4iut3/Documents/raw/master/M1104/ltspice-generateurAC.jpg)

![enter image description here](https://github.com/sl4iut3/Documents/raw/master/M1104/ltspice-bodeRC.jpg)

Il ne reste plus qu'à demander une simulation de type **AC Analysis** réglé de la manière suivante :
* type de *sweep* (variation de fréquence) : **decade**
* nombre de points par décade : 50 par exemple
* fréquence de départ : 1Hz
* fréquence finale : 100kHz par exemple.

![enter image description here](https://github.com/sl4iut3/Documents/raw/master/M1104/ltspice-simulationBode.jpg)

La simulation est lancée en appuyant sur le bouton **Ok** et il faut demander un tracé (bouton de droite sur la zone de tracé, *Add Trace*) et demander le tracé de la sortie sur l'entrée.
![enter image description here](https://github.com/sl4iut3/Documents/raw/master/M1104/ltspice-simulationBode-addtrace.jpg)
Ce qui nous donne :
![enter image description here](https://github.com/sl4iut3/Documents/raw/master/M1104/ltspice-simulation-tout.jpg)
D'où le diagramme de Bode suivant :
![enter image description here](https://github.com/sl4iut3/Documents/raw/master/M1104/ltspice-bode.jpg)



> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIxMzk3ODY2NiwtMTkxNzk4NjY4MywtNj
IzODYwMDA3LC0yMDc1MzE4NzA4LDEwODIzMjEwMjEsLTEwOTUz
NDIxMTcsLTQ4Mzg1NzI0NCwtNzg4OTEyNjIzLDE5NzcwMzc2OT
MsMTg1ODEwMjUzXX0=
-->