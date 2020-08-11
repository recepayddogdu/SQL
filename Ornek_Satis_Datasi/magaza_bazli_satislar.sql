----Bir gundeki magaza bazli satislar----
SELECT DATE_, BRANCH, SUM(LINENET) FROM SALES
WHERE DATE_='20170105' --Gormek istedigimiz tarih
GROUP BY DATE_, BRANCH
ORDER BY SUM(LINENET) DESC



----Bir gundeki magaza bazli satislar----
SELECT DATE_, BRANCH, SUM(LINENET) FROM SALES
--WHERE DATE_='20170105' --Gormek istedigimiz tarih
GROUP BY DATE_, BRANCH
ORDER BY DATE_, SUM(LINENET) DESC