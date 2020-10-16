-- Retrieve All Developers 
SELECT * FROM developers 
JOIN persons 
ON developers.id = persons.id; 

-- Retrieve all developers with id equal to 34 
SELECT * FROM developers 
JOIN persons 
ON developers.id = persons.id
WHERE developers.id = 34; 

-- Retrieve all developers who have a role in Twitter other than owner 
SELECT developers.id, developers.developer_key, persons.first_name, persons.last_name, subquery1.fk_role FROM developers 
JOIN persons 
ON developers.id = persons.id,
 (SELECT * FROM website_roles
  WHERE website_roles.fk_website_id = 234 AND website_roles.fk_role != 'OWNER') subquery1
WHERE subquery1.fk_developer_id = developers.id;   

-- Retrieve all developers who are page reviewers of pages with less than 300000 visits 
SELECT developers.id, developers.developer_key, persons.first_name, 
 persons.last_name, subquery1.fk_role, subquery1.title, subquery1.views FROM developers 
JOIN persons 
ON developers.id = persons.id,
 (SELECT page_roles.fk_developer_id, page_roles.fk_role, pages.views, pages.title FROM page_roles
  JOIN pages
  ON page_roles.fk_page_id = pages.id
  WHERE pages.views < 300000 AND page_roles.fk_role = 'REVIEWER') subquery1
WHERE subquery1.fk_developer_id = developers.id;

-- Retrieve the writer developer who added a heading widget to CNET's home page 
SELECT developers.id, developers.developer_key, persons.first_name, 
 persons.last_name, subquery1.fk_role, subquery1.name, subquery1.title, subquery1.views FROM developers 
JOIN persons 
ON developers.id = persons.id,
 (SELECT page_roles.fk_developer_id, page_roles.fk_role, pages.views, pages.title , websites.name FROM page_roles
  JOIN pages
  ON page_roles.fk_page_id = pages.id
  JOIN websites
  ON pages.fk_website_id = websites.id
  JOIN widgets 
  ON widgets.fk_page_id = pages.id
  WHERE pages.title = 'Home' AND page_roles.fk_role = 'WRITER' 
  AND websites.id = 567 AND widgets.dtype = 'HEADING') subquery1
WHERE subquery1.fk_developer_id = developers.id;

-- ==================================================================

-- Retrieve the website with the least number of visits 
SELECT * FROM websites
ORDER BY visits ASC LIMIT 1; 

-- Retrieve the name of a website whose id is 678 
SELECT name FROM websites 
WHERE id = 678; 

-- Retrieve all websites with videos reviewed by bob 
SELECT * FROM websites 
JOIN pages
ON pages.fk_website_id = websites.id 
JOIN page_roles 
ON page_roles.fk_page_id = pages.id
JOIN widgets 
ON widgets.fk_page_id = pages.id
WHERE widgets.dtype = "YOUTUBE" AND page_roles.fk_role = "REVIEWER" AND page_roles.fk_developer_id = 23; 

-- Retrieve all websites where alice is an owner 
SELECT * FROM websites 
JOIN website_roles 
ON website_roles.fk_website_id = websites.id
WHERE website_roles.fk_role = 'OWNER' AND website_roles.fk_developer_id = 12; 

-- Retrieve all websites where charlie is an admin and get more than 6000000 visits 
SELECT * FROM websites 
JOIN website_roles 
ON website_roles.fk_website_id = websites.id
WHERE website_roles.fk_role = 'ADMIN' AND website_roles.fk_developer_id = 34 AND websites.visits > 6000000;

-- =========================================================

-- Retrieve the page with the most number of views
SELECT * FROM pages
ORDER BY views DESC LIMIT 1;

-- Retrieve the title of a page whose id is 234
SELECT title FROM pages
WHERE id = 234;

-- Retrieve all pages where alice is an editor
SELECT * FROM pages 
JOIN page_roles 
ON page_roles.fk_page_id  = pages.id
WHERE page_roles.fk_role = "EDITOR" AND page_roles.fk_developer_id = 12; 

-- Retrieve the total number of pageviews in CNET 
SELECT SUM(views) FROM pages 
WHERE pages.fk_website_id = 567; 

-- Retrieve the average number of page views in the Website Wikipedia
SELECT AVG(views) FROM pages 
WHERE pages.fk_website_id = 345; 

-- ================================================================

-- Retrieve all widgets in CNET's Home page
SELECT * FROM widgets
WHERE widgets.fk_page_id = 123;

--  Retrieve all youtube widgets in CNN
SELECT * FROM widgets
JOIN pages
ON pages.id = widgets.fk_page_id
WHERE pages.fk_website_id = 456 AND widgets.dtype = "YOUTUBE";

-- Retrieve all image widgets on pages reviewed by Alice
SELECT * FROM widgets
JOIN pages
ON pages.id = widgets.fk_page_id
JOIN page_roles
ON page_roles.fk_page_id = pages.id 
WHERE page_roles.fk_developer_id = 12 AND page_roles.fk_role = 'REVIEWER' AND widgets.dtype = 'IMAGE';

-- Retrieve how many widgets are in Wikipedia
SELECT COUNT(*) FROM widgets
JOIN pages 
ON pages.id = widgets.fk_page_id
WHERE pages.fk_website_id = 345;

-- ======================================================================

-- Retrieve the names of all the websites where Bob has DELETE privileges.
SELECT websites.name 
FROM website_priviledges
JOIN websites 
ON website_priviledges.fk_website_id = websites.id
WHERE website_priviledges.fk_priviledge = 'DELETE' AND website_priviledges.fk_developer_id = 23; 

-- Retrieve the names of all the pages where Charlie has CREATE privileges. 
SELECT pages.title 
FROM page_priviledges
JOIN pages 
ON page_priviledges.fk_page_id = pages.id
WHERE page_priviledges.fk_priviledge = 'CREATE' AND page_priviledges.fk_developer_id = 34; 





