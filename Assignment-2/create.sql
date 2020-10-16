-- Drop tables in order so that tables with foreign keys are dropped before the table that they have the fk for. 
DROP TABLE IF EXISTS `website_roles`;
DROP TABLE IF EXISTS `page_roles`;
DROP TABLE IF EXISTS `roles`;

DROP TABLE IF EXISTS `website_priviledges`;
DROP TABLE IF EXISTS `page_priviledges`;
DROP TABLE IF EXISTS `priviledges`;


DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `developers`;
DROP TABLE IF EXISTS `phones`;
DROP TABLE IF EXISTS `addresses`;
DROP TABLE IF EXISTS `persons`;

DROP TABLE IF EXISTS `widgets`;
DROP TABLE IF EXISTS `pages`;
DROP TABLE IF EXISTS `websites`;

-- persons table
CREATE TABLE `persons` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- developers table
CREATE TABLE `developers` (
  `id` int(11) NOT NULL,
  `developer_key` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `developer_person_generalization` FOREIGN KEY (`id`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- users table
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_agreement` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_person_generalization` FOREIGN KEY (`id`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- phones table
CREATE TABLE `phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(45) DEFAULT NULL,
  `primary` tinyint(1) DEFAULT NULL,
  `fk_person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `phones_persons_composition` FOREIGN KEY (`fk_person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- addresses table
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street1` varchar(45) DEFAULT NULL,
  `street2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `primary` tinyint(1) DEFAULT NULL,
  `fk_person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `addresses_persons_composition` FOREIGN KEY (`fk_person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ===================================================

-- websites table
CREATE TABLE `websites` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created` timestamp DEFAULT '0000-00-00 00:00:00' , 
  `updated` timestamp ON UPDATE CURRENT_TIMESTAMP,
  `visits` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- pages table
CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created` timestamp DEFAULT '0000-00-00 00:00:00', 
  `updated` timestamp ON UPDATE CURRENT_TIMESTAMP,
  `views` int(11) DEFAULT NULL,
  `fk_website_id` int(11) NOT NULL,
  Primary KEY (`id`),
  CONSTRAINT `pages_website_composition` FOREIGN KEY (`fk_website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- widgets table
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `dtype` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `cssClass` varchar(45) DEFAULT NULL, 
  `cssStyle` varchar(45) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `shareable` tinyint(1) DEFAULT NULL,
  `expandable` tinyint(1) DEFAULT NULL,
  `src` varchar(45) DEFAULT NULL,
  `html` varchar(45) DEFAULT NULL,
  `size` int(11) DEFAULT 2,
  `fk_page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `widgets_pages_composition` FOREIGN KEY (`fk_page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ====================================================================

-- roles table  
CREATE TABLE `roles` (
  `role` varchar(45) NOT NULL,
  Primary KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
-- page roles table  
CREATE TABLE `page_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_role` varchar(45) NOT NULL,
  `fk_developer_id` int(11) NOT NULL,
  `fk_page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `page_roles_roles_enumeration` FOREIGN KEY (`fk_role`) REFERENCES `roles` (`role`) ON DELETE CASCADE,
  CONSTRAINT `page_roles_developers_association` FOREIGN KEY (`fk_developer_id`) REFERENCES `developers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `page_roles_pages_association` FOREIGN KEY (`fk_page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- website roles table
CREATE TABLE `website_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_role` varchar(45) NOT NULL,
  `fk_developer_id` int(11) NOT NULL,
  `fk_website_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `website_roles_roles_enumeration` FOREIGN KEY (`fk_role`) REFERENCES `roles` (`role`) ON DELETE CASCADE,
  CONSTRAINT `website_roles_developers_association` FOREIGN KEY (`fk_developer_id`) REFERENCES `developers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `website_roles_website_association` FOREIGN KEY (`fk_website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;    

-- priviledges table
CREATE TABLE `priviledges` (
  `priviledge` varchar(45) NOT NULL,
  Primary KEY (`priviledge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- page priviledges table  
CREATE TABLE `page_priviledges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_priviledge` varchar(45) NOT NULL,
  `fk_developer_id` int(11) NOT NULL,
  `fk_page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `page_priviledges_priviledges_enumeration` FOREIGN KEY (`fk_priviledge`) REFERENCES `priviledges` (`priviledge`) ON DELETE CASCADE,
  CONSTRAINT `page_priviledges_developers_association` FOREIGN KEY (`fk_developer_id`) REFERENCES `developers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `page_priviledges_pages_association` FOREIGN KEY (`fk_page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- website priviledges table
CREATE TABLE `website_priviledges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_priviledge` varchar(45) NOT NULL,
  `fk_developer_id` int(11) NOT NULL,
  `fk_website_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `website_priviledges_priviledges_enumeration` FOREIGN KEY (`fk_priviledge`) REFERENCES `priviledges` (`priviledge`) ON DELETE CASCADE,
  CONSTRAINT `website_priviledges_developers_association` FOREIGN KEY (`fk_developer_id`) REFERENCES `developers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `website_priviledges_website_association` FOREIGN KEY (`fk_website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;  







