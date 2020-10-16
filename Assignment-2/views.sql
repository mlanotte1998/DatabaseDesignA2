DROP VIEW  IF EXISTS `developer_website_roles`;
DROP VIEW  IF EXISTS `developer_page_roles`;
DROP VIEW  IF EXISTS `developer_website_priviledges`;
DROP VIEW  IF EXISTS `developer_page_priviledges`;
DROP VIEW  IF EXISTS `developer_roles_and_priviledges`;



CREATE VIEW `developer_website_roles` AS 
SELECT  persons.first_name AS 'First Name', persons.last_name AS 'Last Name', 
 persons.username AS 'Username', persons.email AS 'Email',
 websites.name AS 'Website Title', websites.visits AS 'Website Visits', 
 websites.updated AS 'Website Last Updated', website_roles.fk_role AS 'Website Role', NULL AS 'Website Priviledge',
 NULL AS 'Page Title', NULL AS 'Page Views', NULL AS 'Page Updated', NULL AS 'Page Role', NULL AS 'Page Priviledge'
FROM website_roles
LEFT JOIN websites 
ON websites.id = website_roles.fk_website_id
LEFT JOIN developers 
ON developers.id = website_roles.fk_developer_id
LEFT JOIN persons 
ON persons.id = developers.id;

CREATE VIEW `developer_page_roles` AS 
SELECT  persons.first_name AS 'First Name', persons.last_name AS 'Last Name', 
 persons.username as 'Username', persons.email as 'Email',
 NULL as 'Website Title', NULL AS 'Website Visits', NULL AS 'Website Last Updated', NULL AS 'Website Role', NULL AS 'Website Priviledge',
 pages.title AS 'Page Title', pages.views AS 'Page Views', 
 pages.updated AS 'Page Last Updated', page_roles.fk_role AS 'Page Role', NULL AS 'Page Priviledge'
FROM page_roles
LEFT JOIN pages 
ON pages.id = page_roles.fk_page_id
LEFT JOIN developers 
ON developers.id = page_roles.fk_developer_id
LEFT JOIN persons 
ON persons.id = developers.id; 

CREATE VIEW `developer_website_priviledges` AS 
SELECT  persons.first_name AS 'First Name', persons.last_name AS 'Last Name', 
 persons.username AS 'Username', persons.email AS 'Email',
 websites.name AS 'Website Title', websites.visits AS 'Website Visits', 
 websites.updated AS 'Website Last Updated', NULL AS 'Website Role', website_priviledges.fk_priviledge AS 'Website Priviledge',
 NULL AS 'Page Title', NULL AS 'Page Views', NULL AS 'Page Updated', NULL AS 'Page Role', NULL AS 'Page Priviledge'
FROM website_priviledges
LEFT JOIN websites 
ON websites.id = website_priviledges.fk_website_id
LEFT JOIN developers 
ON developers.id = website_priviledges.fk_developer_id
LEFT JOIN persons 
ON persons.id = developers.id; 


CREATE VIEW `developer_page_priviledges` AS 
SELECT  persons.first_name AS 'First Name', persons.last_name AS 'Last Name', 
 persons.username as 'Username', persons.email as 'Email',
 NULL as 'Website Title', NULL AS 'Website Visits', NULL AS 'Website Last Updated', NULL AS 'Website Role', NULL AS 'Website Priviledge',
 pages.title AS 'Page Title', pages.views AS 'Page Views', 
 pages.updated AS 'Page Last Updated', NULL AS 'Page Role', page_priviledges.fk_priviledge AS 'Page Priviledge'
FROM page_priviledges
LEFT JOIN pages 
ON pages.id = page_priviledges.fk_page_id
LEFT JOIN developers 
ON developers.id = page_priviledges.fk_developer_id
LEFT JOIN persons 
ON persons.id = developers.id; 

CREATE VIEW `developer_roles_and_priviledges` AS 
SELECT * from `developer_website_roles` 
UNION 
SELECT * from `developer_website_priviledges`
UNION 
SELECT * from `developer_page_roles`
UNION 
SELECT * from `developer_page_priviledges`;








