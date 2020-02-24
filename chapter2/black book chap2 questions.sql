use gregs_list;
SELECT drink_name amount1 from easy_drinks
WHERE amount1 BETWEEN 1.50 and 3.0;

use gregs_list;
SELECT drink_name FROM drink_info
WHERE ice = 'N';

SELECT drink_name FROM drink_info
WHERE NOT calories >= 20;

SELECT drink_name FROM easy_drinks
WHERE main Between'P'and'T';

SELECT drink_name FROM drink_info
WHERE calories > 0;

SELECT drink_name FROM drink_info
WHERE carbs < 3
OR
carbs > 5;

SELECT date_name FROM black_book
WHERE date_name NOT BETWEEN 'A' AND 'C';





