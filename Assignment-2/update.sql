
-- Update developer - Update Charlie's primary phone number to 333-444-5555
UPDATE phones
SET phone = '333-444-5555'
WHERE phones.fk_person_id = 34 AND phones.primary = 1;

--  Update widget - Update the relative order of widget head345 on the page so that it's new order is 3. Note that the other widget's order needs to update as well
UPDATE widgets
SET widgets.order = CASE WHEN widgets.order = 1 THEN 3
					      WHEN widgets.order = 2 THEN 2
                          WHEN widgets.order = 3 THEN 1
                          ELSE widgets.order = widgets.order
                     END
WHERE widgets.fk_page_id = 345;
     
-- Update page - Append 'CNET - ' to the beginning of all CNET's page titles
UPDATE pages
SET pages.title = CONCAT('CNET-', pages.title)  
WHERE pages.fk_website_id = 567;

-- Update roles - Swap Charlie's and Bob's role in CNET's Home page
UPDATE page_roles
SET fk_role = 'WRITER'
WHERE fk_developer_id = 23 AND fk_page_id = 123; 

UPDATE page_roles
SET fk_role = 'REVIEWER'
WHERE fk_developer_id = 34 AND fk_page_id = 123;



 