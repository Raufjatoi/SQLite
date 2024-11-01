CREATE TABLE "passenger" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "station" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "train" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "destination_station_id" INTEGER,
    "departure_station_id" INTEGER,
    FOREIGN KEY ("destination_station_id") REFERENCES "station" ("id"),
    FOREIGN KEY ("departure_station_id") REFERENCES "station" ("id")
);

CREATE TABLE "ticket" (
    "id" INTEGER PRIMARY KEY,
    "passenger_id" INTEGER NOT NULL,
    "train_id" INTEGER NOT NULL,
    FOREIGN KEY ("passenger_id") REFERENCES "passenger" ("id"),
    FOREIGN KEY ("train_id") REFERENCES "train" ("id")
);

INSERT INTO "station" ("name") VALUES ('karachi'), ('nawabshah'), ('lahore ');

INSERT INTO "train" ("name", "destination_station_id", "departure_station_id")
VALUES ('Karachi Express', 1, 2), ('Rawalpindi Express', 2, 3);

INSERT INTO "passenger" ("name") VALUES ('Rauf'), ('Umar');

INSERT INTO "ticket" ("passenger_id", "train_id") VALUES (1, 1), (2, 2);

CREATE VIEW "passenger_bookings" AS
SELECT
    "passenger"."name" AS "passenger_name",
    "train"."name" AS "train_name",
    "departure_station"."name" AS "departure_station",
    "destination_station"."name" AS "destination_station"
FROM
    "passenger"
JOIN
    "ticket" ON "passenger"."id" = "ticket"."passenger_id"
JOIN
    "train" ON "ticket"."train_id" = "train"."id"
JOIN
    "station" AS "departure_station" ON "train"."departure_station_id" = "departure_station"."id"
JOIN
    "station" AS "destination_station" ON "train"."destination_station_id" = "destination_station"."id";