CREATE TABLE "invoice_items"(
    "id" BIGINT NOT NULL,
    "unit_price" DECIMAL(8, 2) NOT NULL,
    "quantity" BIGINT NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "treatment_id" INTEGER NOT NULL
);
CREATE INDEX "invoice_items_id_index" ON
    "invoice_items"("id");
CREATE TABLE "Treatments"(
    "id" BIGINT NOT NULL,
    "type" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
CREATE INDEX "treatments_id_index" ON
    "Treatments"("id");
CREATE TABLE "paitens"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);
CREATE INDEX "paitens_name_index" ON
    "paitens"("name");
CREATE TABLE "medical_histories_has_treatments"(
    "medical_id" BIGINT NOT NULL,
    "treatment_id" BIGINT NOT NULL
);
CREATE INDEX "medical_histories_has_treatments_medical_id_treatment_id_index" ON
    "medical_histories_has_treatments"("medical_id", "treatment_id");
CREATE TABLE "medical_history"(
    "id" INTEGER NOT NULL,
    "admitted_at" DATE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL
);
CREATE INDEX "medical_history_id_patient_id_index" ON
    "medical_history"("id", "patient_id");
CREATE TABLE "invoices"(
    "id" BIGINT NOT NULL,
    "total_amount" DECIMAL(8, 2) NOT NULL,
    "generated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "payed_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" BIGINT NOT NULL
);
CREATE INDEX "invoices_id_index" ON
    "invoices"("id");
ALTER TABLE
    "invoices" ADD CONSTRAINT "invoices_id_foreign" FOREIGN KEY("id") REFERENCES "invoice_items"("invoice_id");
ALTER TABLE
    "paitens" ADD CONSTRAINT "paitens_id_foreign" FOREIGN KEY("id") REFERENCES "medical_history"("patient_id");
ALTER TABLE
    "invoices" ADD CONSTRAINT "invoices_medical_history_id_foreign" FOREIGN KEY("medical_history_id") REFERENCES "medical_history"("id");
ALTER TABLE
    "medical_history" ADD CONSTRAINT "medical_history_id_foreign" FOREIGN KEY("id") REFERENCES "medical_histories_has_treatments"("medical_id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_treatment_id_foreign" FOREIGN KEY("treatment_id") REFERENCES "Treatments"("id");
ALTER TABLE
    "medical_histories_has_treatments" ADD CONSTRAINT "medical_histories_has_treatments_treatment_id_foreign" FOREIGN KEY("treatment_id") REFERENCES "Treatments"("id");