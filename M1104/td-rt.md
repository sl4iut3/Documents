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
En divisant l'équation par $(r+R)C$ on obtient la **forme canonique** de cette équation , c'est-à-dire : 
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
\colorbox{aqua}{$Vc(t)=A+k\exp(-t/\tau)$}
$$
Pour déterminer les constantes $A$ et $k$, on peut s'intéresser à deux valeurs particulières de cette solution :
$$
\begin{aligned}
\colorbox{aqua}{$Vc(t=0)$} &= A+k\exp(0) =\colorbox{aqua}{$A+k$} \\ 
\colorbox{aqua}{$\lim_{t \to\infty}Vc(t)$} &= A+k*0 =\colorbox{aqua}{$A$} 
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

Les constantes sont donc déterminées : $A=E$ et $k=-A=-E$ et la solution complète est donc :
$$
\begin{aligned}
Vc(t) =E+(-E)\exp(-t/\tau)\\
\end{aligned}
$$

$$
\begin{aligned}
\colorbox{aqua}{$Vc = E(1-\exp(-t/\tau))~\textrm{avec}~\tau=RC$}
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

![circuit décomposé pour calculer Thévenin](https://raw.githubusercontent.com/sl4iut3/Documents/master/M1104/fig2Thevenin.png)

Le générateur de Thévenin équivalent se calcule aisément et on obtient les résultats suivants :
$$
\begin{aligned}
Eth&= \frac{R}{R+r}E=6,66666V\\
Rth&=r//R=50*100/(50+100)=33.33\Omega
\end{aligned}
$$
On obtient alors en reconnectant la charge le circuit suivant :

![circuit simplifié avec thévenin](https://github.com/sl4iut3/Documents/raw/master/M1104/tdrt-fig2-thevenin-schema.png)

L'équation de $Vc$ aura donc la même expression que pour le circuit de la figure 1 en remplaçant $E$ par $Eth$ et $r$ par $Rth$. Ceci nous donne l'expression suivante :
$$
\colorbox{aqua}{$Vc(t)=Eth(1-\exp(-t/\tau)) ~\textrm{avec}~ \tau=(Rth+R)C $}
$$

### Figure 2 : ouverture de l'interrupteur K à l'instant t=0

Si K est ouvert, alors E et r n'ont plus aucun rôle dans le circuit (pas de courant dans cette branche du circuit). Ne reste donc que C et les 2 résistances R. 
Le condensateur C va donc se décharger dans les deux résistances R.
Notons $i$ le courant qui circule dans cette maille $(C,R_D, R_G)$ et prenons un courant circulant dans le sens horaire. On peut alors écrire : 
$$
\begin{aligned}
-Ri-Vc-Ri&=0 \\
-2Ri-Vc&=0\\
2Ri+Vc&=0
\end{aligned}
$$
Ce courant $i$ circulant dans le condensateur, on peut alors le remplacer par l'expression bien connue $C\frac{dVc}{dt}$ :
$$
\begin{aligned}
2RC\frac{dVc}{dt}+Vc&=0\\
\frac{dVc}{dt}+\frac{1}{2RC}Vc&=0\\
\end{aligned}
$$
On obtient donc la forme canonique d'une équation du 1ier degré :
$$
\begin{aligned}
\frac{dVc}{dt}+\frac{1}{\tau}Vc&=0 ~~\textrm{avec} ~\tau=2RC
\end{aligned}
$$

Comme d'habitude , la solution de cette équation est : 
$$
Vc(t)=A+k\exp(-t/\tau) ~~\textrm{avec} ~\tau=2RC
$$

**Nouvelles conditions initiales (CI)  à t'=0 (instant où K est ouvert):** 

* Lorsque l'on ouvre l'interrupteur, le condensateur est supposé chargé à sa valeur finale ($Eth$ d'après la question précédente) et donc $\color{red}Vc(t'=0) = A+k = Eth$ 
*  Au bout d'un certain temps ($\infty$ !!, le condensateur est totalement déchargé et donc $\color{red}\lim_{t\to\infty}Vc(t)= A = 0$

et la solution complète est donc:
$$
\colorbox{aqua}{ $Vc(t)=0+Eth\exp(-t/\tau)=Eth\exp(-t/\tau)) $}
$$

**Résultats obtenus par simulation**
![circuit RC simulé vec LTSpice](https://github.com/sl4iut3/Documents/raw/master/M1104/circuitRC.png)

![graphes obtenus](https://github.com/sl4iut3/Documents/raw/master/M1104/circuitRC-graphes.png)

## Exercice 2

### question 1
Pour $i_1$
$$
E-Ri_1=0\\
E=Ri_1\\
i_1=E/R\\
A.N : i_1=10mA
$$
Pour $i_2$ :
$$
E-v_L-ri_2=0 \\
v_L+ri_2=E\\
L\frac{di_2}{dt}+ri_2=E\\
\frac{di_2}{dt}+\frac{r}{L}i_2=\frac{E}{L}
$$

Comme d'habitude , la solution de cette équation est : 
$$
i_2(t)=A+k\exp(-t/\tau) ~~\textrm{avec} ~\tau=\frac{L}{r}
$$
**conditions initiales (CI)  à t'=0 (instant où K est fermé):**
Lorsque K se ferme, le courant à l'instant $t=0$ est nul : $i_2(t=0)=0$.
A partir de $t=0$, la bobine va chercher à s'opposer au courant qui circule ($i_2$) pendant un certain temps. Elle va se charger et lorsque le courant $i_2$ devient constant, la tension aux bornes de la bobine vaut :
$$
\lim_{t \to\infty} v_L(t)=\lim_{t \to\infty}L\frac{di_2}{dt}=0~car~i_2=cste\\
\lim_{t \to\infty}i_2(t)=\frac{E}{r}
$$  
Or, d'après la solution générale, on a :
$$
i_2(t=0)=A+k\exp(0/\tau)=A+k=0\\
\lim_{t \to\infty}i_2(t)=A=\frac{E}{r}
$$
La solution générale devient :
$$
i_2(t)=\frac{E}{r}+(-\frac{E}{r})\exp(-t/\tau) ~~\textrm{avec} ~\tau=\frac{L}{r}
$$
$$
i_2(t)=\frac{E}{r}(1-\exp(-t/\tau) )~~\textrm{avec} ~\tau=\frac{L}{r}
$$
On peut calculer la tension aux bornes de la bobine :
$$
v_L=L\frac{di_2}{dt}=\frac{d}{dt}[ \frac{E}{r}-\frac{E}{r}\exp(-t/\tau) ]\\
v_L=0+\frac{d}{dt}[ -\frac{E}{r}\exp(-t/\tau) \\
v_L=0+( -\frac{E}{r})(\frac{-1}{\tau})\exp(-t/\tau) \\
v_L=0+( -\frac{E}{r})(\frac{-r}{L})\exp(-t/\tau) \\
v_L=\frac{E}{L}\exp(-t/\tau) \\
$$


> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyMjc0NjY5MjksMjI1MjY1MzYzLDExNT
IzNTI5MDksMTU5ODg2MTc3MCwxMjY1OTY0NDE5LDcyMzkyOTM3
NCwtNTMyMzc4MjEzLDIwODcwNjIzODcsLTgxMjI1MTk3OCwxNT
g3ODI0ODM3LDk4NTUwODE0MywxMTM3MDkyMDk0XX0=
-->