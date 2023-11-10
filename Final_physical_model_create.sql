-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-09 16:51:15.867

-- tables
-- Table: cast
create database FINAL
GO
alter table standard
drop CONSTRAINT if exists standard_episode
GO
alter table review
drop CONSTRAINT if exists review_judge
GO
alter table review
drop CONSTRAINT if exists review_episode
GO
alter table kirkland
drop CONSTRAINT if exists kirkland_episode
GO
alter table episode_cast
drop CONSTRAINT if exists episode_cast_judge
GO
alter table episode_cast
drop CONSTRAINT if exists episode_cast_cast
GO
alter table cast
drop CONSTRAINT if exists cast_episode
GO


drop table if exists cast
GO
CREATE TABLE cast (
    cast_id int  NOT NULL,
    cast_episode_id int  NOT NULL,
    CONSTRAINT cast_pk PRIMARY KEY  (cast_id)
);

-- Table: episode
drop table if exists episode
GO
CREATE TABLE episode (
    episode_id int  NOT NULL,
    date date  NOT NULL,
    cast_id int  NOT NULL,
    CONSTRAINT episode_pk PRIMARY KEY  (episode_id)
);

-- Table: episode_cast
drop table if exists episode_cast
GO
CREATE TABLE episode_cast (
    episode_cast_id int  NOT NULL,
    cast_cast_id int  NOT NULL,
    cast_judge_id int  NOT NULL,
    CONSTRAINT episode_cast_pk PRIMARY KEY  (episode_cast_id)
);

-- Table: judge
drop table if exists judge
GO
CREATE TABLE judge (
    judge_id int  NOT NULL,
    first_name varchar(20)  NOT NULL,
    last_name varchar(20)  NOT NULL,
    CONSTRAINT judge_pk PRIMARY KEY  (judge_id)
);

-- Table: kirkland
drop table if exists kirkland
GO
CREATE TABLE kirkland (
    name varchar(20)  NOT NULL,
    type varchar(20)  NOT NULL,
    kirkland_id int  NOT NULL,
    kirkland_episode_id int  NOT NULL,
    CONSTRAINT kirkland_pk PRIMARY KEY  (kirkland_id)
);

-- Table: review
drop table if exists review
GO
CREATE TABLE review (
    review_id int  NOT NULL,
    can_it_kirkland int  NOT NULL,
    review_episode_id int  NOT NULL,
    review_judge_id int  NOT NULL,
    CONSTRAINT review_pk PRIMARY KEY  (review_id)
);

-- Table: standard
drop table if exists standard
GO
CREATE TABLE standard (
    name varchar(20)  NOT NULL,
    type varchar(20)  NOT NULL,
    standard_episode_id int  NOT NULL,
    standard_id int  NOT NULL,
    CONSTRAINT standard_pk PRIMARY KEY  (standard_id)
);

-- foreign keys
-- Reference: cast_episode (table: cast)
ALTER TABLE cast ADD CONSTRAINT cast_episode
    FOREIGN KEY (cast_episode_id)
    REFERENCES episode (episode_id);

-- Reference: episode_cast_cast (table: episode_cast)
ALTER TABLE episode_cast ADD CONSTRAINT episode_cast_cast
    FOREIGN KEY (cast_cast_id)
    REFERENCES cast (cast_id);

-- Reference: episode_cast_judge (table: episode_cast)
ALTER TABLE episode_cast ADD CONSTRAINT episode_cast_judge
    FOREIGN KEY (cast_judge_id)
    REFERENCES judge (judge_id);

-- Reference: kirkland_episode (table: kirkland)
ALTER TABLE kirkland ADD CONSTRAINT kirkland_episode
    FOREIGN KEY (kirkland_episode_id)
    REFERENCES episode (episode_id);

-- Reference: review_episode (table: review)
ALTER TABLE review ADD CONSTRAINT review_episode
    FOREIGN KEY (review_episode_id)
    REFERENCES episode (episode_id);

-- Reference: review_judge (table: review)
ALTER TABLE review ADD CONSTRAINT review_judge
    FOREIGN KEY (review_judge_id)
    REFERENCES judge (judge_id);

-- Reference: standard_episode (table: standard)
ALTER TABLE standard ADD CONSTRAINT standard_episode
    FOREIGN KEY (standard_episode_id)
    REFERENCES episode (episode_id);

-- End of file.

