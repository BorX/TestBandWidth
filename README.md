Utilisation
===========
Configuration
-------------
En crontab :
`0 * * * * /path/to/testBW/testBW.sh 120 >> ~/testBW.log && gnuplot /path/to/testBW/testBW-plot.conf`

Objectifs
=========
Déterminer la véritable bande passante du flux descendant
----------------------------------------------------------
Cesser de lancer un test court à partir d'un unique serveur (comme speedtest.net).
L'intérêt est ici de lancer des downloads pendant des durées plus longues (par exemple 2 minutes), et à partir de divers serveurs.

Tester la banque passante fréquemment
-------------------------------------
Cesser d'effectuer des tests de temps en temps. En effet, les résultats peuvent ainsi être fluctuants à 10 minutes près. En outre, ils ne sont pas révélateurs de la variation de la bande passante selon les heures de la journée (on effectue souvent ce genre de tests aux mêmes heures).
En lançant ce script par crontab, par exemple toutes les heures, on obtient la véritable variation de la bande passante de la journée.

Garder et visualiser l'historique des résultats
-----------------------------------------------
Avec gnuplot, l'historique des résulats est exploité pour dresser un graph qui peut simplement être diffusé, par exemple avec Apache.

Fonctionnement
==============
ToDo Documentation
