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

ALTER TABLE
    "invoices" ADD PRIMARY KEY("id");
CREATE TABLE "Treatments"(
    "id" BIGINT NOT NULL,
    "type" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Treatments" ADD PRIMARY KEY("id");
CREATE TABLE "paitens"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);
ALTER TABLE
    "paitens" ADD PRIMARY KEY("id");
ALTER TABLE
    "Treatments" ADD CONSTRAINT "treatments_id_foreign" FOREIGN KEY("id") REFERENCES "medical_history"("id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_treatment_id_foreign" FOREIGN KEY("treatment_id") REFERENCES "Treatments"("id");
ALTER TABLE
    "invoices" ADD CONSTRAINT "invoices_medical_history_id_foreign" FOREIGN KEY("medical_history_id") REFERENCES "medical_history"("id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "invoices"("id");
ALTER TABLE
    "medical_history" ADD CONSTRAINT "medical_history_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "paitens"("id");
ALTER TABLE
    "medical_history" ADD CONSTRAINT "medical_history_id_foreign" FOREIGN KEY("id") REFERENCES "Treatments"("id");