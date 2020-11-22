
E = 10
tau = 1
set yrange [0:11]
set border linewidth 4
set style line 1 linecolor black linewidth 4
set grid lw 2
set xtics ('tau' 1, '2 tau' 2, '3 tau' 3, '4 tau' 4 , '5 tau' 5)
set ytics ('0' 0, 'E/L' 10, '0.37 E/L' 3.7)

set title "charge de L sous tension constante"
Vl(t) = E*(exp(-t/tau)) 
plot [t=0:6] Vl(t) with lines linestyle 1

