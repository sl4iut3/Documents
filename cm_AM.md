
# Modulation d'amplitude


## Principe de base


-   consiste à remplacer l’amplitude fixe d’un signal sinusoidal par un
    signal variable.

-   le signal variable peut-être:

    -   un signal sinusoidal (pour comprendre et simplifier les calculs)

    -   un signal analogique quelconque (dans la réalité)

    -   un signal binaire (en transmission de données)

-   le signal dont on modifie l’amplitude est nommé signal porteur $s_p$
    de fréquence $f_p$.

-   le signal qui remplace l’amplitude de $s_p(t)$ est nommé signal
    modulant $s_m$.

-   la modulation est réalisée en général par la multiplication
    analogique de $s_p$ par le signal $s_m$

-   Si le signal modulant est lui-même sinusoidal, le calcul devient:

$$s_{AM}(t) &=& s_m(t) . s_p(t) \\
     &=& A_m cos( \omega_m t) E cos( \omega_p t) \\
         &=& {1 \over 2} A_m E [ cos( (\omega_p - \omega_m)t) + cos( (\omega_p + \omega_m)t) ]\end{aligned}$$

-   la modulation d’amplitude se traduit donc en fréquence par 2 raies
    d’amplitude $A_m E/2$: ce sont les bandes latérales.

-   on peut noter l’absence de raie pour la fréquence de la porteuse, ce
    qui peut poser problème pour la démodulation.

Principe réellement utilisé
===========================

[fragile]<span>AM réelle</span>

-   on rajoute en général le signal porteur au signal obtenu par
    multiplication

-   le principe réel est donc le suivant:

$$\begin{aligned}
    s_{AM}(t) &=& s_m(t) . s_p(t) + s_p(t) \\
        &=& (1+s_m(t)).s_p(t) \\
        &=& (1+A_m cos( \omega_m t)) E cos( \omega_p t)\end{aligned}$$

-   Le terme $(1+A_m cos( \omega_m t))$ représente l’amplitude du signal
    porteur.

-   cette amplitude doit être positive ou nulle, donc l’amplitude du
    signal modulant $A_m$ ne doit pas être supérieure à 1.

-   si ce n’est pas le cas, le signal modulant doit être multiplié par
    un terme correctif $k$ tel que $ k A_m $ soit inférieur ou égal à 1.

-   on réécrit donc en utilisant l’indice de modulation $m$:

$$\begin{aligned}
    s_{AM}(t) &=& (1+m cos( \omega_m t)) E cos( \omega_p t) \\
        &=& E cos(\omega_p t) +{{m E} \over 2} [ cos( (\omega_p - \omega_m)t) + cos( (\omega_p + \omega_m)t) ]\end{aligned}$$

-   le spectre obtenu est donc complété par une raie d’amplitude $E$
    pour la fréquence de la porteuse $f_p$

-   cette raie pour la porteuse peut servir à la démodulation

Puissance transportée
=====================

[fragile]<span>Puissance transportée</span>

-   Rappel: En alternatif, la puissance dissipée dans une résistance
    vaut $\frac{V_{eff}^2}{R}$

-   à l’émission AM, la résistance $R$ corresponds à l’antenne
    d’émission

-   à la réception AM, la résistance $R$ est la résistance de charge du
    démodulateur

-   un signal AM est équivalent à un signal constitué de trois
    fréquences: $f_p$, $f_p-f_m$ et $f_p+f_m$

-   la puissance transportée par la porteuse est donc: $$\begin{aligned}
        P_p &=& \frac{E_{eff}^2}{R}=\frac{E^2}{2R}\end{aligned}$$

-   la puissance transportée par chacune des bandes latérales est donc:
    $$\begin{aligned}
        P_{BL} &=& {(\frac{mE_{eff}}{2}})^2 \frac{1}{R} \\
            &=& \frac{m^2E^2}{8R}\end{aligned}$$

-   la puissance totale transportée vaut donc la puissance transportée
    par la porteuse et celle par les 2 bandes latérales:
    $$\begin{aligned}
        P_t &=& P_p +2 P_{BL} \\
            &=& \frac{E^2}{2R}+2\frac{m^2E^2}{8R} \\
                &=& \frac{E^2}{2R} (1+\frac{m^2}{2})\end{aligned}$$

Rendement
=========

[fragile]<span>Rendement</span>

-   le rendement d’une modulation AM est égal à la puissance utile
    divisée par la puisance totale

-   le signal utile en AM est transporté par une seule des deux bandes
    latérales

-   le rendement s’écrit donc: $$\begin{aligned}
        \eta &=& \frac {\frac{m^2E^2}{8R}} {\frac{E^2}{2R} (1+\frac{m^2}{2})} \\
        &=& \frac {\frac{m^2}{4}} {(1+\frac{m^2}{2})} \\
        &=& \frac {m^2} {(4+2m^2)}\end{aligned}$$

-   le rendement $\eta$ varie entre 0 ($m=0$) et $1/6$ ($m=100\%$)

Modulation AM
=============

[fragile]<span>Modulation AM</span>

-   la modulation AM est encore très utilisée de nos jours car la
    détection peut être réalisée de manière très simple: détecteur à
    diode et condensateur par exemple.

-   la modulation AM peut consister à émettre la porteuse et les bandes
    latérales:système gtrès simple mais rendement faible. Exemple:
    stations LW style France Inter 162kHz, émetteur d’Allouis

-   les systèmes portatifs n’émettent en général pas la porteuse, mais
    une ou les deux bandes latérales:

    -   DSB: Double Side Band.

    -   SSB-LSB: Single Side Band, Lower SB

    -   SSB-USB: Single Side Band, Upper SB

Démodulation AM
===============

[fragile]<span>Démodulation AM</span>

-   le démodulateur le plus simple est un circuit détecteur de crête
    (Diode-condensateur C) chargé par une résistqnce R. La constante de
    temps est choisie telle que $ T_{HF} << RC << T_{BF}$

-   on peut aussi utiliser un circuit écréteur pour récupérer la
    porteuse qui multipliée par le signal AM permettra d’obtenir le
    signal modulant

-   on peut utiliser aussi une PLL pour obtenir la porteuse.

-   assez fréquemment, on utilise des récepteurs superhétérodynes qui
    translatent le signal d’entrée autour d’une fréquence FI qui permet
    d’optimiser la détection et l’amplification.

-   le signal étant transmis par l’amplitude, on utilise souvent des CAG
    pour éviter les saturations.

détecteur AM
============

[fragile]<span>détecteur AM</span>

[htbp]

[h] ![image](C:/Users/gl/Downloads/circuit_detecteur_AM.pdf)
[fig:circuit~d~etecteur~A~M]

&

![image](C:/Users/gl/Downloads/detecteur_AM.pdf) [fig:detecteur~A~M]

\
