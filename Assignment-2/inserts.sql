
-- insert developer and user persons
INSERT INTO `persons` VALUES (12,'Alice','Wonder','alice', 'alice','alice@wonder.com', NULL),
 (23,'Bob','Marley', 'bob', 'bob','bob@marley.com', NULL),
 (34,'Charles','Garcia', 'charlie', 'charlie','chuch@garcia.com', NULL),
 (45,'Dan','Martin', 'dan', 'dan','dan@martin.com', NULL),
 (56,'Ed','Karaz', 'ed', 'ed','ed@kar.com', NULL);

-- insert developer specific persons 
INSERT INTO `developers` VALUES (12, '4321rewq'), 
 (23, '5432trew'),
 (34, '6543ytre');
 
-- insert user specific persons 
INSERT INTO `users` VALUES (45, 1),
 (56, 0); 
 
-- ============================================================================ 
 
-- insert websites 
Insert INTO `websites` VALUES (123,'Facebook', 'an online social media and social networking service', NULL, NULL, 1234234),
 (234,'Twitter', 'an online news and social networking service', NULL, NULL, 4321543),
 (345,'Wikipedia', 'an online news and social networking service', NULL, NULL, 3456654),
 (456,'CNN', 'an American basic cable and satellite television news channel', NULL, NULL, 6543345),
 (567,'CNET', 'an American media website that publishes reviews, news, articles, blogs, podcasts and videos on technology and consumer electronics', NULL, NULL, 5433455),
 (678,'Gizmodo', 'a design, technology, science and science fiction website that also writes articles on politics', NULL, NULL, 4322345); 

-- insert website roles for website roles 
INSERT INTO `roles` VALUES ('OWNER'), ('EDITOR'), ('ADMIN'); 

-- insert website roles
INSERT INTO `website_roles` VALUES (NULL, 'OWNER', 12, 123), (NULL, 'EDITOR', 23, 123), (NULL, 'ADMIN', 34, 123), 
   (NULL, 'OWNER', 23, 234), (NULL, 'EDITOR', 34, 234), (NULL, 'ADMIN', 12, 234),
   (NULL, 'OWNER', 34, 345), (NULL, 'EDITOR', 12, 345), (NULL, 'ADMIN', 23, 345),
   (NULL, 'OWNER', 12, 456), (NULL, 'EDITOR', 23, 456), (NULL, 'ADMIN', 34, 456),
   (NULL, 'OWNER', 23, 567), (NULL, 'EDITOR', 34, 567), (NULL, 'ADMIN', 12, 567),
   (NULL, 'OWNER', 34, 678), (NULL, 'EDITOR', 12, 678), (NULL, 'ADMIN', 23, 678);
   
-- ============================================================================   

-- insert pages   
Insert INTO `pages` VALUES (123,'Home', 'Landing page', NULL, NULL, 123434, 567),
 (234,'About', 'Website description', NULL, NULL, 234545, 678),
 (345,'Contact', 'Addresses, phones, and contact info', NULL, NULL, 345656, 345),
 (456,'Preferences', 'Where users can configure their preferences', NULL, NULL, 456776, 456),
 (567,'Profile', 'Users can configure their personal information', NULL, NULL, 567878, 567);
 
-- insert roles for page roles 
INSERT INTO `roles` VALUES ('REVIEWER'), ('WRITER');

 -- insert page roles  
INSERT INTO `page_roles` VALUES (NULL, 'EDITOR', 12, 123), (NULL, 'REVIEWER', 23, 123), (NULL, 'WRITER', 34, 123), 
   (NULL, 'EDITOR', 23, 234), (NULL, 'REVIEWER', 34, 234), (NULL, 'WRITER', 12, 234),
   (NULL, 'EDITOR', 34, 345), (NULL, 'REVIEWER', 12, 345), (NULL, 'WRITER', 23, 345),
   (NULL, 'EDITOR', 12, 456), (NULL, 'REVIEWER', 23, 456), (NULL, 'WRITER', 34, 456),
   (NULL, 'EDITOR', 23, 567), (NULL, 'REVIEWER', 34, 567), (NULL, 'WRITER', 12, 567);
   
-- inserting priviledges and website/page priviledges manually since heroku cant do triggers. 
INSERT INTO `priviledges` VALUES ('CREATE'), ('READ'), ('UPDATE'), ('DELETE'); 

-- Inserting website priveledged manually 
INSERT INTO `website_priviledges` VALUES 
    -- 4 priviledges for alice owner of facebook  
   (NULL, 'CREATE', 12, 123), (NULL, 'READ', 12, 123), (NULL, 'UPDATE', 12, 123), (NULL, 'DELETE', 12, 123),
   -- 2 priviledges for bob editor of facebook 
   (NULL, 'READ', 23, 123), (NULL, 'UPDATE', 23, 123),
   -- 4 priviledes for charlie admin of facebook 
   (NULL, 'CREATE', 34, 123), (NULL, 'READ', 34, 123), (NULL, 'UPDATE', 34, 123), (NULL, 'DELETE', 34, 123),
   -- 4 priviledges for bob owner of twitter 
   (NULL, 'CREATE', 23, 234), (NULL, 'READ', 23, 234), (NULL, 'UPDATE', 23, 234),(NULL, 'DELETE', 23, 234),
   -- 2 priviledges for charlie editor of twitter 
   (NULL, 'READ', 34, 234), (NULL, 'UPDATE', 34, 234),
   -- 4 priviledges for alice admin of twitter
   (NULL, 'CREATE', 12, 234),(NULL, 'READ', 12, 234),(NULL, 'UPDATE', 12, 234),(NULL, 'DELETE', 12, 234),
   -- 4 priviledges for charlie, owner of wikipedia
   (NULL, 'CREATE', 34, 345), (NULL, 'READ', 34, 345), (NULL, 'UPDATE', 34, 345),(NULL, 'DELETE', 34, 345),
   -- 2 priviledges for alice editor of wikipedia 
   (NULL, 'READ', 12, 345), (NULL, 'UPDATE', 12, 345),
   -- 4 priviledges for bob admin of wikipedia
   (NULL, 'CREATE', 23, 345), (NULL, 'READ', 23, 345),(NULL, 'UPDATE', 23, 345),(NULL, 'DELETE', 23, 345),
   -- 4 priviledges for alice owner of CNN
   (NULL, 'CREATE', 12, 456), (NULL, 'READ', 12, 456),(NULL, 'UPDATE', 12, 456),(NULL, 'DELETE', 12, 456),
   -- 2 priviledges for bob editor of CNN 
   (NULL, 'READ', 23, 456), (NULL, 'UPDATE', 23, 456), 
   -- 4 priviledges for charlie admin of CNN
   (NULL, 'CREATE', 34, 456), (NULL, 'READ', 34, 456),(NULL, 'UPDATE', 34, 456),(NULL, 'DELETE', 34, 456),
   -- 4 priviledges for bob owner of CNET
   (NULL, 'CREATE', 23, 567), (NULL, 'READ', 23, 567),(NULL, 'UPDATE', 23, 567),(NULL, 'DELETE', 23, 567),
   -- 2 priviledges for charlie editor of CNET
   (NULL, 'READ', 34, 567),(NULL, 'UPDATE', 34, 567), 
   -- 4 priviledges for alice admin of CNET
   (NULL, 'CREATE', 12, 567),(NULL, 'READ', 12, 567),(NULL, 'UPDATE', 12, 567),(NULL, 'DELETE', 12, 567),
   -- 4 priviledges for charlie owner of Gizmodo
   (NULL, 'CREATE', 34, 678), (NULL, 'READ', 34, 678),(NULL, 'UPDATE', 34, 678),(NULL, 'DELETE', 34, 678),
   -- 2 priviledges for alice editor of Gizmodo
   (NULL, 'READ', 12, 678), (NULL, 'UPDATE', 12, 678),
   -- 4 priviledges for for bob admin of Gizmodo
   (NULL, 'CREATE', 23, 678),(NULL, 'READ', 23, 678),(NULL, 'UPDATE', 23, 678),(NULL, 'DELETE', 23, 678);
   
   
INSERT INTO `page_priviledges` VALUES 
    -- 2 priviledges for alice editor of home  
   (NULL, 'READ', 12, 123), (NULL, 'UPDATE', 12, 123),
   -- 1 priviledges for bob reviewer of home 
   (NULL, 'READ', 23, 123),
   -- 3 priviledes for charlie writer of home 
   (NULL, 'CREATE', 34, 123), (NULL, 'READ', 34, 123), (NULL, 'UPDATE', 34, 123),
   -- 2 priviledges for bob editor of about 
   (NULL, 'READ', 23, 234), (NULL, 'Update', 23, 234),
   -- 1 priviledges for charlie reviewer of about 
   (NULL, 'READ', 34, 234),
   -- 3 priviledges for alice writer of about
   (NULL, 'CREATE', 12, 234),(NULL, 'READ', 12, 234),(NULL, 'Update', 12, 234),
   -- 2 priviledges for charlie, editor of contact
   (NULL, 'READ', 34, 345), (NULL, 'UPDATE', 34, 345),
   -- 1 priviledges for alice reviewer of contact 
   (NULL, 'READ', 12, 345),
   -- 3 priviledges for bob writer of contact
   (NULL, 'CREATE', 23, 345), (NULL, 'READ', 23, 345),(NULL, 'UPDATE', 23, 345),
   -- 2 priviledges for alice editor of preferences
   (NULL, 'READ', 12, 456),(NULL, 'UPDATE', 12, 456),
   -- 1 priviledges for bob reviewer of preferences 
   (NULL, 'READ', 23, 456),  
   -- 3 priviledges for charlie writer of preferences
   (NULL, 'CREATE', 34, 456), (NULL, 'READ', 34, 456),(NULL, 'UPDATE', 34, 456),
   -- 2 priviledges for bob editor of profile
   (NULL, 'READ', 23, 567),(NULL, 'UPDATE', 23, 567),
   -- 1 priviledges for charlie reviewer of profile
   (NULL, 'READ', 34, 567),
   -- 3 priviledges for alice writer of profile
   (NULL, 'CREATE', 12, 567),(NULL, 'READ', 12, 567),(NULL, 'UPDATE', 12, 567); 

-- ========================================================================   

-- insert widgets 
INSERT INTO `widgets` VALUES (123, 'HEADING', 'head123', NULL, NULL, NULL, NULL, 'Welcome', 0, NULL, NULL, NULL, NULL, NULL, NULL, 123), 
 (234, 'HTML', 'post234', NULL, NULL, NULL, NULL, '<p>Lorem</p>', 0, NULL, NULL, NULL, NULL, NULL, NULL, 234),
 (345, 'HEADING', 'head345', NULL, NULL, NULL, NULL, 'Hi', 1, NULL, NULL, NULL, NULL, NULL, NULL, 345),
 (456, 'HTML', 'intro456', NULL, NULL, NULL, NULL, '<h1>Hi</h1>', 2, NULL, NULL, NULL, NULL, NULL, NULL, 345),
 (567, 'IMAGE', 'image345', 50, 100, NULL, NULL, NULL, 3, '/img/567.png', NULL, NULL, NULL, NULL, NULL, 345),
 (678, 'YOUTUBE', 'video456', 400, 300, NULL, NULL, NULL, 0, 'https://youtu.be/h67VX51QXiQ', NULL, NULL, NULL, NULL, NULL, 456); 
 
-- =========================================================================
 
 -- insert phones for persons
INSERT INTO `phones` VALUES (NULL, '123-234-3456', 1, 12), (NULL, '234-345-4566', 0, 12), 
 (NULL, '345-456-5677', 1, 23), 
 (NULL, '321-432-5435', 1, 34), (NULL, '432-432-5433', 0, 34), (NULL, '543-543-6544', 0, 34); 
 
-- insert addresses for persons 
INSERT INTO `addresses` VALUES (NULL, '123 Adam St.', NULL, 'Alton', 'MA', '01234', 1, 12), (NULL, '234 Birch St.', NULL, 'Boston', 'MA', '02345', 0, 12), 
 (NULL, '345 Charles St.',  NULL, 'Chelms', 'MA', '03455', 1, 23), (NULL, '456 Down St.', NULL, 'Dalton', 'MA', '04566', 0, 23), (NULL, '543 East St.', NULL, 'Everett', 'MA', '01112', 0, 23),
 (NULL, '654 Frank St', NULL, 'Foulton', 'MA', '04322', 1, 34);  
 
 
 

