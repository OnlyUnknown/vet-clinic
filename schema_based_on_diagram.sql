CREATE TABLE "medical_history"(
    "id" INTEGER NOT NULL,
    "admitted_at" DATE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "medical_history" ADD PRIMARY KEY("id");
CREATE TABLE "invoice_items"(
    "id" BIGINT NOT NULL,
    "unit_price" DECIMAL(8, 2) NOT NULL,
    "quantity" BIGINT NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "treatment_id" INTEGER NOT NULL
);
ALTER TABLE
    "invoice_items" ADD PRIMARY KEY("id");
CREATE TABLE "invoices"(
    "id" BIGINT NOT NULL,
    "total_amount" DECIMAL(8, 2) NOT NULL,
    "generated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "payed_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" BIGINT NOT NULL
);