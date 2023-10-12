-- Script that ranks country origins by their number of fans



SELECT origin, COUNT(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
