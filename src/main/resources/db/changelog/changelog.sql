--liquibase formatted sql

--changeset apejkovic:1
CREATE TABLE users
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    username     VARCHAR(255) NOT NULL UNIQUE,
    password     VARCHAR(255) NOT NULL UNIQUE,
    email        VARCHAR(255) NOT NULL,
    first_name   VARCHAR(255) NULL,
    last_name    VARCHAR(255) NULL,
    title        VARCHAR(255) NULL,
    created_date date NULL,
    CONSTRAINT pk_users PRIMARY KEY (id)
);

CREATE TABLE roles
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NULL,
    CONSTRAINT pk_roles PRIMARY KEY (id)
);

CREATE TABLE users_roles
(
    role_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    CONSTRAINT pk_users_roles PRIMARY KEY (role_id, user_id),
    CONSTRAINT fk_userol_on_role FOREIGN KEY (role_id) REFERENCES roles (id),
    CONSTRAINT fk_userol_on_user FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE permissions
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NULL,
    CONSTRAINT pk_permissions PRIMARY KEY (id)
);

CREATE TABLE roles_permissions
(
    permission_id BIGINT NOT NULL,
    role_id       BIGINT NOT NULL,
    CONSTRAINT pk_roles_permissions PRIMARY KEY (permission_id, role_id),
    CONSTRAINT fk_rolper_on_permission FOREIGN KEY (permission_id) REFERENCES permissions (id),
    CONSTRAINT fk_rolper_on_role FOREIGN KEY (role_id) REFERENCES roles (id)
);

CREATE TABLE companies
(
    id                  BIGINT AUTO_INCREMENT NOT NULL,
    name                VARCHAR(255) NOT NULL UNIQUE,
    director            VARCHAR(255) NULL,
    registration_number VARCHAR(255) NOT NULL UNIQUE,
    tax_number          VARCHAR(255) NOT NULL UNIQUE,
    bank_account        VARCHAR(255) NOT NULL UNIQUE,
    street              VARCHAR(255) NULL,
    zip                 VARCHAR(255) NULL,
    city                VARCHAR(255) NULL,
    phone               VARCHAR(255) NULL,
    email               VARCHAR(255) NOT NULL UNIQUE,
    website             VARCHAR(255) NULL,
    CONSTRAINT pk_companies PRIMARY KEY (id)
);
