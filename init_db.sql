CREATE SCHEMA IF NOT EXISTS megasoft_bd;

SET SCHEMA megasoft_bd;

CREATE TABLE IF NOT EXISTS worker (
    id          BIGINT PRIMARY KEY,
    name        VARCHAR(1000) NOT NULL,
    birthday    DATE,
    level       VARCHAR(7) NOT NULL,
    salary      INT,
    CHECK (LENGTH(name) >= 2),
    CHECK (YEAR(birthday) > 1900),
    CHECK (level IN ('Trainee','Junior','Middle','Senior')),
    CHECK (salary >= 100 AND salary <= 100000)
);

CREATE TABLE IF NOT EXISTS client (
    id          BIGINT PRIMARY KEY,
    name        VARCHAR(1000) NOT NULL,
    CHECK (LENGTH(name) >= 2)
);

CREATE TABLE IF NOT EXISTS project (
    id          BIGINT PRIMARY KEY,
    client_id   BIGINT NOT NULL,
    start_date  DATE,
    finish_date DATE,
    FOREIGN KEY(client_id) REFERENCES client(id)
);

CREATE TABLE IF NOT EXISTS project_name (
    project_id          BIGINT NOT NULL,
    name        VARCHAR(1000) NOT NULL,
    CHECK (LENGTH(name) >= 2),
    FOREIGN KEY(project_id) REFERENCES project(id)
);

CREATE TABLE IF NOT EXISTS project_worker (
    project_id  BIGINT NOT NULL,
    worker_id   BIGINT NOT NULL,
    PRIMARY KEY (project_id, worker_id),
    FOREIGN KEY(project_id) REFERENCES project(id),
    FOREIGN KEY(worker_id) REFERENCES worker(id)
);

DROP ALL OBJECTS;