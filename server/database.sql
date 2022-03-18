CREATE DATABASE affaren;

CREATE TABLE taxes (
    taxe_id SERIAL PRIMARY KEY,
    taxe_amount DOUBLE PRECISION NOT NULL,
    taxe_name VARCHAR(255) NOT NULL
);

CREATE TABLE payment_methods (
    payment_method_id SERIAL PRIMARY KEY,
    payment_method_name VARCHAR(255) NOT NULL
);

CREATE TABLE sales_transactions (
    sale_id SERIAL PRIMARY KEY,
    sale_total DOUBLE PRECISION DEFAULT 0,
    taxe_amount DOUBLE PRECISION DEFAULT 0,
    payment_method_id INTEGER DEFAULT NULL,
    sale_paid BOOLEAN NOT NULL DEFAULT FALSE,
    tva_1 DOUBLE PRECISION DEFAULT 0,
    tva_2 DOUBLE PRECISION DEFAULT 0,
    tva_3 DOUBLE PRECISION DEFAULT 0,
    hors_taxe_1 DOUBLE PRECISION DEFAULT 0,
    hors_taxe_2 DOUBLE PRECISION DEFAULT 0,
    hors_taxe_3 DOUBLE PRECISION DEFAULT 0,
    total_1 DOUBLE PRECISION DEFAULT 0,
    total_2 DOUBLE PRECISION DEFAULT 0,
    total_3 DOUBLE PRECISION DEFAULT 0,
    sale_year INTEGER DEFAULT NULL,
    sale_month INTEGER DEFAULT NULL,
    sale_day INTEGER DEFAULT NULL,
    sale_time VARCHAR DEFAULT NULL,
    sale_splitted BOOLEAN NOT NULL DEFAULT FALSE,
    payment_method_id_2 INTEGER DEFAULT NULL,
    payment_method_id_2_total DOUBLE PRECISION DEFAULT NULL
);

CREATE TABLE products_in_transactions (
    sale_id INTEGER NOT NULL,
    product_id INTEGER,
    quantity INTEGER NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_price DOUBLE PRECISION NOT NULL,
    taxe_id INTEGER,
    sale_day INTEGER,
    sale_month INTEGER,
    sale_year INTEGER,
    CONSTRAINT fk_sales_transactions 
        FOREIGN KEY (sale_id)
            REFERENCES sales_transactions(sale_id),
    UNIQUE (sale_id, product_id)
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_supplier_id INTEGER,
    product_name VARCHAR(255),
    product_price DOUBLE PRECISION,
    product_quantity INTEGER,
    product_alert INTEGER DEFAULT 5,
    product_barcode BIGINT DEFAULT NULL,
    taxe_id INTEGER NOT NULL,
    CONSTRAINT fk_taxes
        FOREIGN KEY (taxe_id)
            REFERENCES taxes(taxe_id),
);