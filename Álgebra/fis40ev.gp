reset
set term fig color landscape big solid textspecial font ',14'
set out 'fis40ev.fig'
azulunir = 3
set datafile separator ","
set xdata time
set timefmt '%m/%d/%y 00:00:00'
unset mxtics
set key box at "08/15/20", 52 width -2.75 height 2 opaque
set grid lc azulunir
set size ratio .45
set xrange ["05/02/20":"12/31/20"]
set yrange [-3:59]
set xlabel "D\\'ia/Mes" offset 35,4.5 
set ylabel "Episodios" offset 8,8 rotate by 90
set border lw 3 lc azulunir
set ytics 10 offset 0.5,0 rotate by 0 right tc rgb 0
set xtics 30*day offset 0,0.3 rotate by 0 center tc rgb 0
set format x "%d/%m"
m=1e-7;n=1; f(x) = m*(x)+n
fit f(x) 'fis40evolution.csv' using 1:2 via m,n
plot 'fis40evolution.csv' using (column("Time (UTC)")):(column("Plays")) ps 1 pt 5 lc azulunir title "",  \
["05/20/20":"12/25/20"] f(x) lw 4 lc azulunir title sprintf("$y=%s\\ x%i$", gprintf("%.0s\\times10^{%S}", m), n) 
