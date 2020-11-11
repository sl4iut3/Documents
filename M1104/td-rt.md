# TD Régime Transitoire

## Rappels
### Régime transitoire (RT) / régime permanent (RP)
Circulation automobile
* RT : en ville, sur route encombrée, sur autoroute lors d'un départ en vacances, dans un bouchon : on n'arrête pas d'accélérer, de freiner, voire de s'arrêter.
* RP : sur autoroute quand il y a peu de circulation : on peut rester à une vitesse stable (régulateur branché par exemple) pendant une longue durée.

Avion 
* RT : au décollage et à l'atterrissage.
* RP : lorsque l'avion est au sol parqué sur le tarmac, ou alors quand il est en vol de croisière (altitude et vitesse stables, pilote automatique enclenché).

Moteur (électrique, par exemple)

* RT : lorsqu'on vient de le mettre en fonctionnement ou lorsqu'on l'arrête.
* RP : lorsqu'il tourne à sa vitesse de rotation stable (vitesse de rotation $\omega$ nominale)

**Condensateur / Inductance**
* RT : lorsque le composant se charge ou se décharge à la mise en fonctionnement ou à l'extinction. Formules à utiliser :
$$
i_C = C \frac{dV_C}{dt}~~\textrm{et}~~v_L=L\frac{di_L}{dt}
$$
* RP : lorsque le composant est soumis à un signal sinusoïdal de fréquence stable (**régime harmonique**). Formules à utiliser :
$$
Z_C=\frac{1}{jC\omega} ~~\textrm{et}~~ Z_L=jL\omega
$$
## Exercice  1

### Figure 1 : fermeture de l'interrupteur K à l'instant t=0
Ecrivons l'équation de maille :

$$
\begin{aligned}
E -ri-Vc-Ri &= 0 \\
(r+R)i+Vc &=E 
\end{aligned}
$$
Or, le courant $i$  du circuit, circule aussi dans le condensateur. Donc : $i=i_C=C\frac{dVc}{dt}$. Remplaçons $i$ par cette expression dans l'équation de maille. On obtient alors l'équation différentielle du 1ier ordre suivante : 
$$
\begin{aligned}
(r+R)C\frac{dVc}{dt}+Vc&=E \\
\end{aligned}
$$
En divisant l'équation par $(r+R)C$ on obtient la forme canonique de cette équation , c'est-à-dire : 
$$
\begin{aligned}
\frac{dVc}{dt}+\frac{1}{(r+R)C}Vc&=\frac{E}{(r+R)C} \\
\end{aligned}
$$
Si l'on appelle  la constante de temps $\tau$, la quantité $(r+R)C$, on obtient :

$$
\begin{aligned}
\frac{dVc}{dt}+\frac{1}{\tau}Vc&=\frac{E}{\tau} 
\end{aligned}
$$

Mathématiquement parlant, la solution de cette équation est : 
$$
\color{blue}Vc(t)=A+k\exp(-t/\tau)
$$
Pour déterminer les constantes $A$ et $k$, on peut s'intéresser à deux valeurs particulières de cette solution :
$$
\begin{aligned}
Vc(t=0) &= A+k\exp(0) =A+k \\ 
\lim_{t \to\infty}Vc(t) &= A+k*0 =A 
\end{aligned}
$$

Il ne nous reste plus qu'à déterminer les constantes $A$ et $k$ grâce aux conditions initiales et finales.

**Conditions initiales et finales lors de la fermeture de K pour le circuit de la figure 1 :**

* le condensateur est initialement déchargé, donc $\color{red}v_C(t=0)=0$. 
* Quand il sera chargé complètement au bout d'un temps important (par exemple si $t \to+\infty$), il n'y aura plus de courant qui circulera dans le circuit (plus de courant de charge puisque C sera chargé). La seule possibilité est alors que $\color{red}v_C=E$, ce que l'on écrira sous la forme $\color{red}\lim_{t \to\infty}Vc(t)= E$

On obtient donc :
$$
\begin{aligned}
Vc(t=0) &= A+k = 0\\
\lim_{t\to\infty}Vc(t) &= A = E\\
\end{aligned}
$$

La solution complète est donc :
$$
\begin{aligned}
Vc(t) &=E+(-E)\exp(-t/\tau)\\
&= \color{red}E(1-\exp(-t/\tau))
\end{aligned}
$$
Voir le cours de Math pour approfondir les équations différentielles ou encore [ce lien pour ceux qui voudraient plus de détails sur les équations différentielles,](http://www.tsi.lycee-louis-vincent.fr/wp-content/uploads/2013/12/equadiff.pdf) 

### Figure 1 : ouverture de l'interrupteur K à l'instant t=0
K ouvert, donc aucun courant ne peut circuler. Le condensateur ne peut donc se décharger et donc le condensateur reste dans l'état où il était (c'est-à-dire chargé). La tension à ses bornes est donc $E$.


### Figure 2 : fermeture de l'interrupteur K à l'instant t=0
Procédons de la même manière que précédemment : écrivons les équations de maille en notant $R_G$ (resp. $R_D$ la résistance $R$ de gauche (resp. de droite) :
$$
\begin{aligned}
E - Vr -V_{R_G}  &=0 \\
E-vr-Vc-V_{R_D} &=0\\
-V_{R_G}-Vc-V_{R_D} &=0 
\end{aligned}
$$
un peu compliqué....
Utilisons plutôt le théorème de Thévenin : la charge C+R déconnectée, il reste un générateur "compliqué" : E, r et R

![circuit](https://raw.githubusercontent.com/sl4iut3/Documents/master/M1104/fig2Thevenin.png)

Le générateur de Thévenin équivalent se calcule aisément et on obtient 
$$
Eth= \frac{R}{R+r}E=6,66666V\\
Rth=r//R=50*100/150=33.33\Omega
$$
Figure TODO
donc la solution complète (d'après le schéma de la fig. 1) est :
$$
Vc(t)=Eth(1-\exp(-t/\tau))
$$
avec $\tau=(Rth+R)C$
### Figure 2 : ouverture de l'interrupteur K à l'instant t=0

Si K est ouvert, alors E et r n'ont plus aucun rôle dans le circuit (pas de courant dans cette branche du circuit). Ne reste que C et les 2 résistances R.
$$
\begin{aligned}
-Ri-Vc-Ri&=0 \\
-2Ri-Vc&=0\\
2Ri+Vc&=0\\
2RC\frac{dVc}{dt}+Vc&=0\\
\frac{dVc}{dt}+\frac{1}{2RC}Vc&=0\\
\frac{dVc}{dt}+\frac{1}{\tau}Vc&=0
\end{aligned}
$$
avec $\tau=2RC$
La solution de cette équation est : 
$$
Vc(t)=A+k\exp(-t/\tau)
$$
avec $\tau=2RC$

Nouvelles conditions initiales (CI)  à t'=0 (instant où K est ouvert): 

* $Vc(t'=0) = A+k = Eth$ 
*  $\lim_{t->\infty}Vc(t)= A = 0$

donc la solution complète est :
$$
Vc(t)=0+Eth\exp(-t/\tau)=Eth\exp(-t/\tau))
$$
figure todo

> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTc5NDI2MzE1NSwtODEyMjUxOTc4LDE1OD
c4MjQ4MzcsOTg1NTA4MTQzLDExMzcwOTIwOTRdfQ==
-->