SET SQL_SAFE_UPDATES = 0;

-- Delete developer - Delete Alice's primary address
DELETE addresses 
FROM addresses
JOIN persons 
ON persons.id = addresses.fk_person_id
WHERE persons.first_name = 'Alice' AND addresses.primary = 1;

-- Delete widget - Remove the last widget in the Contact page. The last widget is the one with the highest value in the order field
DELETE widgets
FROM widgets 
WHERE id = (SELECT x.id 
              FROM (SELECT * FROM widgets) as x
              WHERE x.fk_page_id = 345 
              ORDER BY x.order DESC LIMIT 1); 
              

-- Delete page - Remove the last updated page in Wikipedia
DELETE pages
FROM pages
WHERE id = (SELECT x.id 
              FROM (SELECT * FROM pages) as x
              WHERE x.fk_website_id = 345
              ORDER BY x.updated DESC LIMIT 1); 
              
              
-- Delete website - Remove the CNET web site, as well as all related roles and privileges relating developers to the Website and Pages              
DELETE websites
FROM websites
WHERE id = 567;



