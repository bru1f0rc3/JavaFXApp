CREATE TABLE agenttype (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    image VARCHAR(100)
);

CREATE TABLE materialtype (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    defectedpercent DOUBLE PRECISION NOT NULL
);

CREATE TABLE producttype (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    defectedpercent DOUBLE PRECISION NOT NULL
);

CREATE TABLE supplier (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    inn VARCHAR(12) NOT NULL,
    startdate DATE NOT NULL,
    qualityrating INT,
    suppliertype VARCHAR(20)
);

CREATE TABLE agent (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    agenttypeid INT NOT NULL REFERENCES agenttype(id),
    address VARCHAR(300),
    inn VARCHAR(12) NOT NULL,
    kpp VARCHAR(9),
    directorname VARCHAR(100),
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255),
    logo VARCHAR(100),
    priority INT NOT NULL
);

CREATE TABLE material (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    countinpack INT NOT NULL,
    unit VARCHAR(10) NOT NULL,
    countinstock DOUBLE PRECISION,
    mincount DOUBLE PRECISION NOT NULL,
    description TEXT,
    cost DECIMAL(10,2) NOT NULL,
    image VARCHAR(100),
    materialtypeid INT NOT NULL REFERENCES materialtype(id)
);

CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    producttypeid INT REFERENCES producttype(id),
    articlenumber VARCHAR(10) NOT NULL,
    description TEXT,
    image VARCHAR(100),
    productionpersoncount INT,
    productionworkshopnumber INT,
    mincostforagent DECIMAL(10,2) NOT NULL
);

CREATE TABLE agentpriorityhistory (
    id SERIAL PRIMARY KEY,
    agentid INT NOT NULL REFERENCES agent(id),
    changedate TIMESTAMP NOT NULL,
    priorityvalue INT NOT NULL
);

CREATE TABLE materialcounthistory (
    id SERIAL PRIMARY KEY,
    materialid INT NOT NULL REFERENCES material(id),
    changedate TIMESTAMP NOT NULL,
    countvalue DOUBLE PRECISION NOT NULL
);

CREATE TABLE productcosthistory (
    id SERIAL PRIMARY KEY,
    productid INT NOT NULL REFERENCES product(id),
    changedate TIMESTAMP NOT NULL,
    costvalue DECIMAL(10,2) NOT NULL
);

CREATE TABLE materialsupplier (
    materialid INT NOT NULL REFERENCES material(id),
    supplierid INT NOT NULL REFERENCES supplier(id),
    PRIMARY KEY (materialid, supplierid)
);

CREATE TABLE productmaterial (
    productid INT NOT NULL REFERENCES product(id),
    materialid INT NOT NULL REFERENCES material(id),
    count DOUBLE PRECISION,
    PRIMARY KEY (productid, materialid)
);

CREATE TABLE productsale (
    id SERIAL PRIMARY KEY,
    agentid INT NOT NULL REFERENCES agent(id),
    productid INT NOT NULL REFERENCES product(id),
    saledate DATE NOT NULL,
    productcount INT NOT NULL
);

CREATE TABLE shop (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    address VARCHAR(300),
    agentid INT NOT NULL REFERENCES agent(id)
);
