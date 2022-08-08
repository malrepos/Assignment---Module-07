-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Lb6wre
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "transactions" (
    "id" INT   NOT NULL,
    "date" VARCHAR(30)   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card" VARCHAR(20)   NOT NULL,
    "id_merchant" INT   NOT NULL,
    "cardholder_id" INT   NOT NULL,
    CONSTRAINT "pk_transactions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "merchants" (
    "id" INT   NOT NULL,
    "name" VARCHAR(20)   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    "merchant_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_merchants" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "clients" (
    "cardholder_id" INT   NOT NULL,
    "name" VARCHAR(30)   NOT NULL,
    "card" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_clients" PRIMARY KEY (
        "cardholder_id"
     )
);

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "merchants" ("id");

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_cardholder_id" FOREIGN KEY("cardholder_id")
REFERENCES "clients" ("cardholder_id");

